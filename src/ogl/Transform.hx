package ogl;

@:jsRequire("ogl", "Transform")
extern class Transform {
    var position: Vec3;
    var rotation: Euler;
    var parent: Null<Transform>;
    var children: Array<Transform>;
    public function new(): Void;
    public function lookAt(target: Vec3, ?inverse: Bool): Void;
    public function setParent(node: Null<Transform>, ?notifyChild: Bool): Void;
    public function addChild(child: Transform, ?notifyChild: Bool): Void;
    public function removeChild(child: Transform, ?notifyChild: Bool): Void;
}