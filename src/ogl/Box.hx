package ogl;

import ogl.Geometry.CreateGeometryProps;

typedef BoxProps = {
    var ?width: Float;
    var ?height: Float;
    var ?depth: Float;
    var ?widthSegments: Float;
    var ?heightSegments: Float;
    var ?depthSegments: Float;
    var ?attributes: CreateGeometryProps;
}

@:jsRequire("ogl", "Box")
extern class Box extends Geometry {
    public function new(gl: GL, ?options: BoxProps): Void;
    public function setDrawRange(start: Int, count: Int): Void;
}