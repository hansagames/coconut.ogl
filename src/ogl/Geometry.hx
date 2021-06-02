package ogl;

import js.html.CanvasElement;
import js.lib.Float32Array;
import js.lib.Uint32Array;

typedef GeometryData<T> = {
    var size: Int;
    var data: T;
};

typedef CreateGeometryProps = {
    var position: GeometryData<Float32Array>;
    var ?uv: GeometryData<Float32Array>;
    var ?normal: GeometryData<Float32Array>;
    var ?index: GeometryData<Uint32Array>;
    var ?tangent: GeometryData<Float32Array>;
}
@:jsRequire("ogl", "Geometry")
extern class Geometry {
    public function new(gl: GL, options: CreateGeometryProps): Void;
    public function setDrawRange(start: Int, count: Int): Void;
}