package;

import coconut.ogl.View;
import js.Browser;
import ogl.Transform;
import ogl.Camera;
import ogl.Vec3;

class Playground {
	var renderer: ogl.Renderer;
	var scene: Transform;
	var camera: Camera;
	static function main() {
		new Playground();
	}

	public function new() {
		final canvas = Browser.document.createCanvasElement();
		renderer = new ogl.Renderer({
			canvas: canvas
		});
		scene = new Transform();
		camera = new Camera(renderer.gl, { fov: 35 });
		camera.position.set(0, 1, 7);
        camera.lookAt(new Vec3(0, 0, 0));
		Browser.document.body.appendChild(canvas);

		coconut.ogl.Renderer.mount(scene, <MyView/>);
		Browser.window.requestAnimationFrame(render);
	}
	private function render(delta: Float): Void {
		renderer.render({ scene: scene, camera: camera });
		Browser.window.requestAnimationFrame(render);
	}
}

class MyView extends View {
	@:state var value:Int = 0;
	function render() '
		<BoxMesh />
	';
}
