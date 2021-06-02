package coconut.ogl;

import coconut.diffing.VNode;
import ogl.Transform;

@:pure
abstract RenderResult(VNode<Transform>) to VNode<Transform> from VNode<Transform> {
	inline function new(n) {
		this = n;
	}

	@:from static function ofNode(n:Transform):RenderResult {
		return VNode.embed(n);
	}
}