package prismic;

extern class Fragments
{
	@:overload(function() : String {})
	function asHtml(linkResolver : LinkResolver) : String;
	@:overload(function() : String {})
	function asText(linkResolver : LinkResolver) : String;
}

extern class UrlFragments extends Fragments
{
	public var value(default, null) : Dynamic;

	@:overload(function() : String {})
	function url(linkResolver : LinkResolver) : String;
}

interface LinkFragment
{
	public function url(linkResolver : LinkResolver) : String;
	public function asHtml(linkResolver : LinkResolver) : String;
	public function asText(linkResolver : LinkResolver) : String;
}

///////////////////////////////////////////////////////////////////////////////

extern class Text extends Fragments
{
}

extern class DocumentLink extends WithFragments implements LinkFragment
{
	public var value(default, null) : Dynamic;
	public var document(default, null) : Doc;
	public var id(default, null) : String;
	public var uid(default, null) : String;
	public var tags(default, null) : Array<String>;
	public var slug(default, null) : String;
	public var type(default, null) : String;
	public var fragments(default, null) : Array<Dynamic>;
	public var isBroken(default, null) : Bool;

	public function url(linkResolver : LinkResolver) : String;
}

extern class WebLink extends UrlFragments implements LinkFragment
{	
}

extern class FileLink extends UrlFragments implements LinkFragment
{
}

extern class ImageLink extends UrlFragments implements LinkFragment
{
}

extern class Select extends Fragments
{
}

extern class Color extends Fragments
{
}

extern class GeoPoint extends Fragments
{
}

extern class Number extends Fragments
{
}

extern class DateFragment extends Fragments
{
}

extern class Timestamp extends Fragments
{
}

extern class Embed extends Fragments
{
}

extern class ImageEl extends Fragments
{
	public var main(default, null) : ImageView;
	public var url(default, null) : String;
	public var views(default, null) : Array<ImageView>;

	public function getView(name : String) : ImageView;
}

extern class ImageView extends Fragments
{
	public var url(default, null) : String;
	public var width(default, null) : Int;
	public var height(default, null) : Int;
	public var alt(default, null) : String;

	public function ratio() : Float;
}

extern class Group
{
	public function asHtml(linkResolver : LinkResolver) : String;
	public function toArray() : Array<Doc.GroupDoc>;
	public function asText(linkResolver : LinkResolver) : String;
	public function getFirstImage() : ImageView;
	public function getFirstTitle() : StructuredText;
	public function getFirstParagraph() : StructuredText;
}

typedef Block = Dynamic;

extern class StructuredText
{
	public function getTitle() : Block;
	public function getFirstParagraph() : Block;
	public function getParagraphs() : Array<Block>;
	public function getParagraph(n : Int) : Block;
	public function getFirstImage() : ImageView;
	
	@:overload(function(linkResolver : LinkResolver, htmlSerializer : Dynamic) : String {})
	public function asHtml(linkResolver : LinkResolver) : String;

	@:overload(function() : String {})
	public function asText(linkResolver : LinkResolver) : String;
}

extern class Slice<T>
{
	public function asHtml(linkResolver : LinkResolver) : String;
	public function asText(linkResolver : LinkResolver) : String;

	public function getFirstImage() : ImageView;
	public function getFirstTitle() : Block;
	public function getFirstParagraph() : Block;

	public var sliceType(default, null) : String;
	public var label(default, null) : String;
	public var value(default, null) : T;
}

extern class SliceZone
{
	public function asHtml(linkResolver : LinkResolver) : String;
	public function asText(linkResolver : LinkResolver) : String;

	public function getFirstImage() : ImageView;
	public function getFirstTitle() : Block;
	public function getFirstParagraph() : Block;

	public var slices(default, null) : Array<Slice<Dynamic>>;
}
