package mualloy.util;

public class AUnitTestCase {

  String testName;
  String body;
  int scope;
  int expect;

  public AUnitTestCase(String testName, String body, int scope, int expect) {
    this.testName = testName;
    this.body = body;
    this.scope = scope;
    this.expect = expect;
  }

  public String toString(int num) {
    String name = testName + num;
    return "pred " + name + " {\n" + body + "\n}\nrun " + name + " for " + scope + " expect "
        + expect;
  }

  @Override
  public boolean equals(Object obj) {
    if (obj == null) {
      return false;
    }
    if (this == obj) {
      return true;
    }
    if (!(obj instanceof AUnitTestCase)) {
      return false;
    }
    AUnitTestCase testCase = (AUnitTestCase) obj;
    return body.equals(testCase.body);
  }

  @Override
  public int hashCode() {
    return body.hashCode();
  }
}
