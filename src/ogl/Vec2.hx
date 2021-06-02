package ogl;

@:jsRequire("ogl", "Vec2")
extern class Vec2 {
    public function new(?x: Float, ?y: Float): Void;
    var x: Float;
    var y: Float;
    public function set(x: Float, y: Float): Void;
    public function multiply(v: Float): Vec2;
    public function normalize(): Vec2;
    public function clone(): Vec2;
    public function sub(v: Vec2, ?v2: Vec2): Vec2;
}