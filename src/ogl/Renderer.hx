package ogl;

import js.html.webgl.PowerPreference;
import js.html.CanvasElement;

typedef RenderProps = {
    var scene: Transform;
    var camera: Camera;
}

typedef RendererOptions = {
    var ?canvas: CanvasElement;
    var ?dpr: Float;
    var ?antialias: Bool;
    var ?powerPreference: PowerPreference;
};

@:jsRequire("ogl", "Renderer")
extern class Renderer {
    public function new(options: RendererOptions): Void;
    public var gl: GL;
    public function setSize(width: Float, height: Float): Void;
    public function render(props: RenderProps): Void;

}