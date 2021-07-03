package coconut.ogl.internal;

import coconut.ogl.macros.Setup;
import haxe.macro.Context;
import haxe.macro.Type;
import haxe.macro.Expr;
using haxe.macro.Tools;
using tink.MacroApi;

class Attributes {

	static function getInitObj(cl:ClassType)
		return switch cl.constructor {
			case null: Failure('${cl.name} has no constructor');
			case _.get().type.reduce() => t:
				switch t {
					case TFun([_, o], _): Success(o.t);
					default: Failure('${cl.name} has an incompatible constructor signature');
				}
		}

	static public function getFields(cl:ClassType)
		return getInitObj(cl).sure().getFields().sure();

	static function build()
		return switch tink.macro.BuildCache.getParams("coconut.ogl.internal.Attributes") {
			case Success([TInst(_.get() => cl, _)]):
				getInitObj(cl).sure();
			default:
				throw 'assert';
		}
}