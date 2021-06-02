package coconut.ogl;

import coconut.diffing.Implicit;
import coconut.ogl.RenderResult;
import ogl.Transform;

class Implicit extends Implicit<Transform, RenderResult> {
	static final TYPE = Implicit.type();

	static public function fromHxx(attr):RenderResult {
		return VWidget(TYPE, null, null, attr);
	}
}
