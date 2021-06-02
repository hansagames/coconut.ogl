package coconut.ogl.internal;

import haxe.macro.Context;
using tink.MacroApi;

class RNode {

	static function build() {
		return tink.macro.BuildCache.getType("coconut.ogl.internal.RNode", null, null, function (ctx) {
			var name = ctx.name,
					target = ctx.type.toComplex();

			var ret =
				macro class $name extends coconut.diffing.internal.VNativeBase.RNativeBase<
					coconut.ogl.internal.VNode<$target>,
					ogl.Transform,
					$target
				> {
					final setters = new coconut.ogl.internal.Setters<$target>();
					public function new(v, cls, parent, cursor, later) {
						super(v, cls, parent, cursor, later);
						setters.set(native, v.data, null, this, parent, later);
					}
					override function updateNative(native:$target, next:coconut.ogl.internal.VNode<$target>, prev:coconut.ogl.internal.VNode<$target>, parent, later) {
						setters.set(native, next.data, prev.data, this, parent, later);
					}
				}

			function add(td)
				ret.fields = ret.fields.concat(td.fields);

			switch Context.follow(Context.typeof(macro (null:coconut.ogl.internal.Attributes<$target>))) {
				case TAnonymous(_.get().fields => fields):
					var rr = Context.getType('coconut.ogl.RenderResult');
					for (f in fields) if (f.type.unifiesWith(rr)) {
						var name = f.name;

						var setter = 'set_$name';
						add(macro class {
							var $name:coconut.ogl.internal.Inlay;
							public function $setter(param, parent, later) {
								if (this.$name == null)
									this.$name = new coconut.ogl.internal.Inlay(parent, (child) -> native.$name = child);
								this.$name.update(param, later);
							}
						});
					}
				default:
			}

			return ret;
		});
	}
}