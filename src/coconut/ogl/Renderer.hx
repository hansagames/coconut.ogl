package coconut.ogl;

import coconut.diffing.*;
import tink.state.Observable;
import ogl.Transform;
import ogl.GL;

@:allow(coconut.ogl)
class Renderer {
	static public function mountInto(ctx:{ target:Transform, gl:GL }, virtual:RenderResult) {
		Root.fromNative(ctx.target, new OglUIBackend(ctx.gl)).render(virtual);
	}

	static public function getNative(view:View):Null<Transform> {
		return getAllNative(view)[0];
	}

	static public function getAllNative(view:View):Array<Transform> {
		return Widget.getAllNative(view);
	}

	static public inline function updateAll() {
		Observable.updateAll();
	}

	static public macro function hxx(e);

	static public macro function mount(target, markup);
}

private class OglUICursor extends Cursor<Transform> {
	var pos:Int;
	final container:Transform;

	public function new(applicator, container:Transform, pos:Int) {
		super(applicator);
		this.container = container;
		this.pos = pos;
	}

	public function insert(real:Transform) {
		container.children.insert(pos++, real);
		real.setParent(this.container, false);
	}

	public function delete(count:Int) {
		for (i in 0...count) {
			container.removeChild(container.children[pos]);
		}

	}
}

private class OglUIBackend implements Applicator<Transform> {
	final gl:GL;
	public function new(gl) {
		this.gl = gl;
	}

	public function siblings(target:Transform):Cursor<Transform> {
		return new OglUICursor(this, target.parent, target.parent.children.indexOf(target));
	}
	public function children(target:Transform):Cursor<Transform> {
		return new OglUICursor(this, target, 0);
	}

	static final pool = [];

	public function createMarker():Transform
		return switch pool.pop() {
			case null: new Transform();
			case v: v;
		}

	public function releaseMarker(m:Transform)
		pool.push(m);
}