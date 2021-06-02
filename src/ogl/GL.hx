package ogl;

import  js.html.webgl.RenderingContext;

@:jsRequire("ogl", "GL")
class GL extends RenderingContext {
    var renderer: Renderer;
}