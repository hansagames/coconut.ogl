package ogl;

@:jsRequire("ogl", "Eulor")
extern class Euler {
    public function new(?x: Float, ?y: Float, ?z: Float): Void;
    var x: Float;
    var y: Float;
    var z: Float;
    public function set(x: Float, y: Float, z: Float): Void;
}