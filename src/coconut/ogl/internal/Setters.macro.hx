package coconut.ogl.internal;

import coconut.ogl.internal.Attributes.*;
import haxe.macro.Type;
import haxe.macro.Expr;
using haxe.macro.Tools;
using tink.MacroApi;

class Setters {

	static function build() {
		return tink.macro.BuildCache.getType("coconut.ogl.internal.Setters", null, null, function(ctx) {
			var name = ctx.name,
					target = ctx.type.toComplex(),
					cls = ctx.type.getClass(),
					init = [];

			function process(cls:ClassType, maxDepth:Int) {
				if (maxDepth < 1) return;
				for (f in getFields(cls)) {
					var name = f.name,
							type = f.type.toComplex();
					var expr = macro target.$name = nu;
					init.push(macro ret.set($v{name}, function (target, nu:$type, old:$type, rnode, parent, later) $expr));
				}
			}

			process(cls, switch cls {
				case { pack: ['ogl'], name: 'Transform'}: 0;
				default: 1;
			});

			var ret = macro class $name {

				static final INST = {
					var ret = new Map<String, (target:$target, next:Dynamic, prev:Dynamic, rnode:coconut.ogl.internal.RNode<$target>, parent:coconut.diffing.internal.Parent, later:(task:()->Void)->Void)->Void>();
					$b{init};
					ret;
				}

				public inline function new()
					this = INST;

				public function set(
					target:$target,
					nu:coconut.ogl.internal.Attributes<$target>,
					old:coconut.ogl.internal.Attributes<$target>,
					rnode:coconut.ogl.internal.RNode<$target>,
					parent:coconut.diffing.internal.Parent,
					later:(task:()->Void)->Void
				)
					coconut.diffing.Factory.Properties.set(target, cast nu, cast old, (target, name, nu, old) -> this[name](target, nu, old, rnode, parent, later));
			}

			ret.kind = TDAbstract(macro : Map<String, (target:Dynamic, next:Dynamic, prev:Dynamic, rnode:Dynamic, parent:coconut.diffing.internal.Parent, later:(task:()->Void)->Void)->Void>);
			ret.meta.push({ name: ':forward', params: [macro keyValueIterator], pos: (macro null).pos });
			return ret;
		});
	}
}