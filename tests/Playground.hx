package;

import coconut.ogl.View;
import js.Browser;
import ogl.Transform;
import ogl.Camera;
import ogl.Vec3;

import js.html.webgl.PowerPreference;
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
			canvas: canvas,
			antialias: true,
			dpr: 2,
			powerPreference: PowerPreference.HIGH_PERFORMANCE,
		});
		scene = new Transform();
		camera = new Camera(renderer.gl, { fov: 35 });
		camera.position.set(0, 1, 7);
        camera.lookAt(new Vec3(0, 0, 0));
		Browser.document.body.appendChild(canvas);
		coconut.ogl.Renderer.mount({ target: scene, gl: renderer.gl }, <MyView/>);
		Browser.window.requestAnimationFrame(render);
		resize();
		Browser.window.addEventListener("resize", resize, false);
	}
	private function render(delta: Float): Void {
		renderer.render({ scene: scene, camera: camera });
		Browser.window.requestAnimationFrame(render);
	}
	private function resize() {
		renderer.setSize(Browser.window.innerWidth, Browser.window.innerHeight);
		camera.perspective({ aspect: renderer.gl.canvas.width / renderer.gl.canvas.height });
	}
}

class MyView extends View {
	@:state var value:Int = 0;
	function render() '
		<BoxMesh />
	';
}
