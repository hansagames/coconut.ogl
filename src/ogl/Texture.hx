package ogl;

import js.html.Image;
import haxe.extern.EitherType;

typedef TextureProps = {
    var ?wrapS: Int;
    var ?wrapT: Int;
    var ?flipY: Bool;
    var ?target: Int;
};
@:jsRequire("ogl", "Texture")
extern class Texture {
    public var image: EitherType<Image, Array<Image>>;
    public function new(gl: GL, ?options: TextureProps): Void;
}