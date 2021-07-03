package coconut.ogl.internal;

using tink.MacroApi;

class VNode {

	static function build() {
		return tink.macro.BuildCache.getType("coconut.ogl.internal.VNode", null, null, function (ctx) {
			var name = ctx.name,
					target = ctx.type.toComplex();

			return macro class $name extends coconut.diffing.internal.VNativeBase<ogl.Transform, $target> {

				static final TYPE = new coconut.diffing.TypeId();

				public final data:coconut.ogl.internal.Attributes<$target>;

				public function new(data, ?key, ?ref, ?children) {
					super(TYPE, key, ref, children);
					this.data = data;
				}

				var gl:ogl.GL;
				override public function render(parent, cursor, later, hydrate):coconut.diffing.internal.RNode<ogl.Transform> {
					this.gl = (cast cursor).applicator.gl;
					var ret = new coconut.ogl.internal.RNode<$target>(this, $i{name}, parent, cursor, later);
					return ret;
				}

				override function create(?previous) {
					return @:privateAccess ${ctx.type.getID().instantiate([macro this.gl, macro this.data])};//this is not good
				}
			};
		});
	}
}