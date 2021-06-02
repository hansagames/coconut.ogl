package coconut.ogl;

class Renderer {
	static public function hxx(e) {
		return coconut.ogl.macros.HXX.parse(e);
	}

	static function mount(target, markup) {
		return coconut.ui.macros.Helpers.mount(macro coconut.ogl.Renderer.mountInto, target, markup, hxx);
	}
}
