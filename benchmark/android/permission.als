module androidPermisison

/**
	* A model of the Android Permission Protocol
	*
	* Authors: Hamid Bagheri & Eunsuk Kang (hbagheri, eskang@mit.edu)
	*/

open util/relation as rel
open util/ordering[Time] as to

sig Time {}
abstract sig Name {}
sig AppName, PermName extends Name {}
sig URI {}	// content URI
sig AppSignature {}

abstract sig Permission {}
// URI permission for content providers
abstract sig URIPermission extends Permission {
	uri : URI
}
// component permission
abstract sig CompPermission extends Permission {
	name: PermName,
	protectionLevel: ProtectionLevel
}

abstract sig ProtectionLevel {}
one sig Normal, Dangerous, Signature extends ProtectionLevel {}
one sig Device {
	builtinPerms : set CompPermission,
	apps: Application -> Time,
	// permissions that are currently active on the device
	customPerms: CompPermission -> Time
}{
	all t: Time | customPerms.t in (apps.t).declaredPerms
}

sig Application {
	name : AppName,
	signature : AppSignature,
    // set of permissions that the app declares in the app manifest
	// (also called custom permissions)
	declaredPerms: set CompPermission,
    // set of permissions that the app uses. It is modeled after the
	// <uses-permission> tag in the app manifest
	// http://developer.android.com/guide/topics/manifest/uses-permission-element.html
	usesPerms: set PermName,
	// permissions that are granted to this app at each time
	grantedPerms: Permission -> Time,
	// permission that other apps need to have to interact with this app
	guard : lone PermName,
	components: set Component
}{
	guard in (declaredPerms + Device.builtinPerms).name
	no p1,p2: declaredPerms |
		p1.name = p2.name and
		p1.protectionLevel != p2.protectionLevel
}

abstract sig Component {
	app: one Application,
	// a component may have any number of filters,
	// each one describing a different component's capability
	intentFilter: set IntentFilter,
	// permission that other apps need to have to access this component
	guard: lone PermName,
	// (c, t) is a tuple in causes if "this" has (directly or indirectly) caused a call to "c"
	// in the history leading up to "t"
	causes : Component -> Time
}{
	guard in (app.declaredPerms + Device.builtinPerms).name
	this in app.components
}

fact CausalChain {
	// define what it means for some component ("from") to cause a call to another ("to")
	all from, to : Component, t : Time - last |
		from -> to in causes.t iff {
			// "from" directly invokes "to"
			invoke[t, t.next, from, to] or
			// there's an intermediate component "c'" such that "from" causes c' and "c'" invokes "to"
			(some c' : Component | from -> c' in causes.t and invoke[t, t.next, c', to]) or
			// "(from, to)" is already in the causal chain in the previous time step
			(t != first and from -> to in causes.(t.prev))
		}
	causes.last = causes.(last.prev)
}

fact Wellformedness {
	// each Component belongs to exactly one Application
	components in Application one -> Component
	// no custom permissions can be named the same way as a built-in permission
	no p : Application.declaredPerms | p.name in Device.builtinPerms.name
	// all predefined permissions have a distinct name
	no disj p1, p2 : Device.builtinPerms | p1.name = p2.name
}

abstract sig Activity extends Component {}
abstract sig Service extends Component {}
// broadcast receiver
abstract sig BroadcastReceiver extends Component {}

// Path in a content provider
// Represents a table in the database of the provider
abstract sig ContentPath extends Component {
	provider : ContentProvider
}{
	no guard + causes.Time + intentFilter
}
// content provider
abstract sig ContentProvider extends Component {
	paths : URI -> lone ContentPath,
	protectedPaths : set URI,	// paths that are protected with URI permission
	privatePaths: set URI		// paths that are private and should not be shared with other apps
}{
	protectedPaths + privatePaths in paths.ContentPath
	paths[URI].@app = app
	paths[URI].provider = this
}

// To inform the system which implicit intents they can handle,
// components can have one or more intent filters.
 sig IntentFilter {
	// A filter may list more than one action
	// The list cannot be empty
	actions: some Action,
	dataType: some DataType,
	dataScheme: some DataScheme,
	// For an intent to pass the category test, every category
	// in the Intent object must match a category in the filter.
	// The filter can list additional categories,
	//but it cannot omit any that are in the intent.
	categories: set Category
}

// Elements of an Intent:
// Three attributes of an Intent are checked  when tested against a filter:
// Action, Category, and Data
// Action is a Name that names the general action to be performed.
abstract sig Action {}

// Category is a Name containing additional information about the kind of
// component that should handle the intent
abstract sig Category {}

// The type of data supplied is generally dictated by the intent's action.
// For example, if the action is ACTION_EDIT, the data should contain
// the URI of the document to edit.
abstract sig DataType {}
abstract sig DataScheme {}

fact IntentFilterConsts {
	all i:IntentFilter| some i.~intentFilter
// Three of the core components of an application, namely
// activities, services, and broadcast receivers, can
// have one or more intent filters.
// To exclude provider from having intent filters,
// we add a separate fact constraint specification.
 	no i:IntentFilter| i.~intentFilter in ContentProvider
}

sig Intent {
	sender: one Component,
	component: lone Component,
	action: one Action,
	dataType: one DataType,
	dataScheme: one DataScheme,
	categories: set Category
}

// In the initial state, no app is installed, and no custom-permission is defined
pred init[t: Time] {
	no Device.apps.t
	no Device.customPerms.t
    // fix: one to no
	one Application.grantedPerms.t
}

// When "app" is installed, grant a permission for each of
// the "uses-permissions" that are requested by the app.
// The protection level depends on the permissions that
// are currently active on the device.
pred grantPermissions[app : Application, t : Time] {
    // Fix: in to =
	app.grantedPerms.t.name in app.usesPerms
	app.grantedPerms.t in Device.customPerms.t + Device.builtinPerms
}

// The app installation is described by this operation:
pred install[t, t': Time, app: Application] {
    // fix: in to  !in
	app in Device.apps.t
  	Device.apps.t' = Device.apps.t + app
	grantPermissions[app, t']
	Device.customPerms.t' = Device.customPerms.t + newCustomPerms[t,app]
	// no changes to other apps
	// fix: all a : Application to all a : Application - app
	all a : Application  | a.grantedPerms.t' = a.grantedPerms.t
}

pred install_fixed[t, t' : Time, app : Application] {
	app not in Device.apps.t
  	Device.apps.t' = Device.apps.t + app
	grantPermissions[app, t']
	-- can't install an app with a declared permission that's named the same as existing one
	no p : app.declaredPerms | p.name in (Device.customPerms.t).name
	Device.customPerms.t' = Device.customPerms.t + app.declaredPerms
	all a : Application - app | a.grantedPerms.t' = a.grantedPerms.t
}

// This function returns a set of permissions that are declared in "app"
// and not already active on the device
fun newCustomPerms[t : Time, app : Application] : set CompPermission {
	{p : app.declaredPerms |  p.name not in (Device.customPerms.t).name }
}

// This function returns the currently active permission with name p
fun findPermissionByName[p : PermName, t : Time] : one CompPermission {
	Device.customPerms.t & name.p
}

fun findAppByName[a : AppName, t : Time] : one Application {
	Device.apps.t & name.a
}

// This function returns a set of custom-permissions that are declared
// before "app" is installed
fun customPermsBeforeAppInstallation[app : Application] : set CompPermission {
	let bAppT = min[app.(Device.apps)].prev {
		Device.customPerms.bAppT
	}
}

pred uninstall[t, t': Time, app: Application] {
	app in Device.apps.t // precondition
	Device.apps.t' = Device.apps.t - app
	// also remove active permissions defined by this app
	Device.customPerms.t' = Device.customPerms.t - app.declaredPerms
	// no changes to other apps
	all a : Application - app | a.grantedPerms.t' = a.grantedPerms.t
}

pred uninstall_fixed[t, t': Time, app: Application] {
	app in Device.apps.t // precondition
	Device.apps.t' = Device.apps.t - app
	Device.customPerms.t' = Device.customPerms.t - app.declaredPerms
	all a : Application - app | a.grantedPerms.t' = a.grantedPerms.t - app.declaredPerms
}

// the trace constraint that form the states (install/unistall apps) into an execution trace
pred traces {
	init [first]
	all t: Time-last | let t' = t.next |
		some app: Application, c1, c2: Component, n : Name, u : URI|
			install [t, t', app]
			or uninstall [t, t', app]
			or invoke[t, t', c1, c2]
			or grantURIPermission[t, t', c1, n, u]
}

pred traces_fixed {
	init [first]
	all t: Time-last | let t' = t.next |
		some app: Application, c1, c2: Component, n : Name, u : URI |
			install_fixed [t, t', app]
			or uninstall_fixed [t, t', app]
			or invoke[t, t', c1, c2]
			or grantURIPermission[t, t', c1, n, u]
}

assert UniquePermissionName {
	traces implies
		no disj p1,p2: CompPermission| p1.name = p2.name
}

pred noChanges[t, t': Time] {
	Device.customPerms.t' = Device.customPerms.t
	Device.apps.t' = Device.apps.t
	all a : Application | a.grantedPerms.t' = a.grantedPerms.t
}

// Operation for a content provider to grant an URI permission to another application
pred grantURIPermission[t, t' : Time, granter: ContentProvider, grantee: AppName, u: URI] {
	let granteeApp = findAppByName[grantee, t] {
		-- precondition
		granter.app + granteeApp in Device.apps.t
		u in granter.protectedPaths
		some p : URIPermission {
			-- postcondition
			p.uri = u
			granteeApp.grantedPerms.t' = granteeApp.grantedPerms.t + p
			all a : Application - granteeApp | a.grantedPerms.t' = a.grantedPerms.t
		}
		-- no changes to the device
		Device.customPerms.t' = Device.customPerms.t
		Device.apps.t' = Device.apps.t
	}
}

pred invoke[t, t' : Time, caller, callee: Component]{
    // fix: change & to +
	caller.app & callee.app in Device.apps.t
	// call succeeds only if caller has "uses-permission" for the permission guarding the provider
	canCall[caller, callee, t]
	// nothing changes
	noChanges[t, t']
}

fun guardedBy : Component -> PermName {
	{c: Component, p: Name |
		// component-specific permission takes priority over the app-wide permission
    	// http://developer.android.com/guide/topics/manifest/application-element.html#prmsn
		(p = c.guard) or
		(no c.guard and p = c.app.guard)
	}
}

pred checkURIPermission[caller, callee: Component, t : Time] {
	let provider = callee.provider |
		-- callee must be a path that exists in provider
		some provider.paths.callee and {
			-- either callee is a public path, so no permission is required, or
			provider.paths.callee not in provider.(protectedPaths + privatePaths) or
			-- caller has a URI permission that points to the callee
			some p : caller.app.grantedPerms.t & URIPermission | provider.paths[p.uri] = callee
		}
}

pred canCall[caller, callee: Component, t : Time] {
	callee in ContentPath implies
		checkURIPermission[caller, callee, t]
	else
		// the permission required to access the callee is one of the caller's uses-permissions
		guardedBy[callee] in (caller.app.grantedPerms.t).name
}

pred authorized[caller, provider: Component, t:Time] {
	let pname = guardedBy[provider],
		grantedPermission = caller.app.grantedPerms.t & name.pname,
		requiredPermission =
 			(provider.app.declaredPerms + Device.builtinPerms) & name.pname |
				some pname implies
					// the  permission granted to the caller must be equal or higher than
					// the permission required to access the component
					// (as originally declared by the provider's app)
					(equalOrHigher[grantedPermission.protectionLevel,
											requiredPermission.protectionLevel])
}

pred equalOrHigher[p1, p2 : ProtectionLevel] {
	not lower[p1, p2]
}

// one component can call another only if it's authorized to do so
assert NoUnauthorizedAccess {
	traces implies
		all t : Time - last, caller, callee : Component |
			invoke[t, t.next, caller, callee] implies authorized[caller, callee, t]
}

assert NoPrivateContentAccessedByExternalApp {
	traces implies
		all t : Time - last,  caller, callee : Component |
			let provider = callee.provider |
				(invoke[t, t.next, caller, callee] and
				callee in ContentPath and
				provider.paths.callee in provider.privatePaths)
					implies caller.app.signature = callee.app.signature
}

// if one component (directly or indrectly) causes a call to another component,
// it must be authorized to do so
// This is a generalization of NoPrivilegeEscalation property
assert NoImproperDelegation {
	traces implies
		all t : Time - last, provider, caller : Component |
			causedBy[t, provider, caller] implies authorized[caller, provider, t]
}

pred causedBy[t : Time, sink, source: Component] {
	source -> sink -> t in causes
}

pred lower[p1, p2 : ProtectionLevel] {
	(p1 = Normal and p2 != Normal) or
	(p1 = Dangerous and p2 = Signature)
}


fact Assumption {
	// can't install an app with the same name as existing one
	all t : Time - last, app : Application |
		install[t, t.next, app] implies
			app.name not in (Device.apps.t).name

	// grants private URI permissions only to apps with the same signature
	all t : Time - last, p : ContentProvider, u : URI, n : AppName |
		grantURIPermission[t, t.next, p, n, u] implies {
			u in p.privatePaths implies findAppByName[n,t].signature = p.app.signature
		}

	// providers in the same app don't share the paths
	all app : Application, c1, c2 : app.components |
		(c1 + c2 in ContentProvider and c1 != c2) implies
			no c1.paths.ContentPath & c2.paths.ContentPath
}

check UniquePermissionName for 2
check NoUnauthorizedAccess for 3 but 4 Time, 2 Application, 2 Component, 2 Permission
check NoUnauthorizedAccess for 3 but 6 Time, 2 Application, 2 Component, 2 Permission
check NoUnauthorizedAccess for 5
check NoPrivateContentAccessedByExternalApp for 3 but 5 Component, 5 Time, 2 Application
check NoPrivateContentAccessedByExternalApp for 4 but 6 Time, 4 Application, 5 Component
check NoImproperDelegation for 4 but 3 Component, 3 Application, 7 Time


assert repair_assert_1 {
traces implies
		all t : Time - last,  caller, callee : Component |
			let provider = callee.provider |
				(invoke[t, t.next, caller, callee] and
				callee in ContentPath and
				provider.paths.callee in provider.privatePaths)
					implies caller.app.signature = callee.app.signature
}

pred repair_pred_1 {
traces implies
		all t : Time - last,  caller, callee : Component |
			let provider = callee.provider |
				(invoke[t, t.next, caller, callee] and
				callee in ContentPath and
				provider.paths.callee in provider.privatePaths)
					implies caller.app.signature = callee.app.signature
}

check repair_assert_1 for 3 but 5 Component, 5 Time, 2 Application
run repair_pred_1 for 3 but 5 Component, 5 Time, 2 Application