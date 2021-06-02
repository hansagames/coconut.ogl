package coconut.ogl;

class View {
	static function hxx(_, e) {
		return coconut.ogl.macros.HXX.parse(e);
	}

	static function autoBuild() {
		return coconut.diffing.macros.ViewBuilder.autoBuild(macro:coconut.ogl.RenderResult);
	}
}
