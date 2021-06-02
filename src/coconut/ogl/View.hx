package coconut.ogl;

import coconut.diffing.Widget;

@:build(coconut.ui.macros.ViewBuilder.build((_ : coconut.ogl.RenderResult)))
@:autoBuild(coconut.ogl.View.autoBuild())
class View extends Widget<ogl.Transform> {
	macro function hxx(e);
}
