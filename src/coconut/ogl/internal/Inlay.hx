package coconut.ogl.internal;

import coconut.diffing.Cursor;
import ogl.Transform;
import coconut.diffing.internal.*;

class Inlay {
	static final applicator = Renderer.BACKEND;

	var state = Empty;

	final parent:Parent;
	final assign:Transform->Void;

	public function new(parent, assign) {
		this.parent = parent;
		this.assign = assign;
	}

	public function update(r:RenderResult, later) {
		final singular = (cast r:coconut.diffing.internal.VNode<Transform>).isSingular;

		function createSingular() {
			state = Singular(new RCell(parent, r, new SingleCursor(assign), later));
		}

		function createPlural() {
			final sprite = new Transform();
			state = Plural(new RCell(parent, r, applicator.children(sprite), later));
			assign(sprite);
		}

		switch r {
			case null:
				destroy();
			default:
				switch state {
					case Singular(cell):
						if (singular)
							cell.update(r, new SingleCursor(assign), later);
						else {
							destroy();
							createPlural();
						}
					case Plural(cell):
						if (singular) {
							destroy();
							createSingular();
						}
						else cell.update(r, null, later);
					case Empty:
						if (singular) createSingular();
						else createPlural();
				}
		}
	}

	function destroy() {
		switch state {
			case Plural(cell):
				cell.destroy(applicator);
				assign(null);
			case _:
		}
		state = Empty;
	}
}

private enum InlayState {
	Empty;
	Singular(cell:RCell<Transform>);
	Plural(p:RCell<Transform>);
}

private class SingleCursor implements Cursor<Transform> {
	public final applicator = Renderer.BACKEND;
	final assign:Transform->Void;

	public function new(assign) {
		this.assign = assign;
	}

	public function insert(native:Transform):Void {
		assign(native);
	}

	public function delete(count:Int):Void {
		if (count > 0)
			assign(null);
	}
}