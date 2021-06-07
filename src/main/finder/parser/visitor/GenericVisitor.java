package parser.visitor;

import parser.ast.AModel;
import parser.ast.*;

public interface GenericVisitor<R, V> {
    R visit(AModel model, V arg);

    R visit(Assert asserts, V arg);

    R visit(Opens open, V arg);

    R visit(SigDef sigDef, V arg);

    R visit(DeclField decl, V arg);

    R visit(DeclParam decl, V arg);

    R visit(DeclVar decl, V arg);

    R visit(Fact fact, V arg);

    R visit(Predicate pred, V arg);

    R visit(ExprnBinaryBool exp, V arg);

    R visit(ExprnBinaryRel expr, V arg);

    R visit(ExprnCallBool expr, V arg);

    R visit(ExprnCallRel expr, V arg);

    R visit(ExprnConst expr, V arg);

    R visit(ExprnField expr, V arg);

    R visit(ExprnITEBool expr, V arg);

    R visit(ExprnITERel expr, V arg);

    R visit(ExprnLet expr, V arg);

    R visit(ExprnListBool expr, V arg);

    R visit(ExprnListRel expr, V arg);

    R visit(ExprnQtBool expr, V arg);

    R visit(ExprnQtRel expr, V arg);

    R visit(ExprnSig expr, V arg);

    R visit(ExprnVar expr, V arg);

    R visit(ExprnUnaryBool expr, V arg);

    R visit(ExprnUnaryRel expr, V arg);

    R visit(Function func, V arg);
}
