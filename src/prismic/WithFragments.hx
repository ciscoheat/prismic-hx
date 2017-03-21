package prismic;

extern class WithFragments 
{
	public function get(name : String) : Null<Dynamic>;
	public function getAll(name : String) : Array<Dynamic>;
	public function getImage(fragmentName : String) : Null<Fragments.ImageEl>; // (Referring to Image in lib)
	public function getAllImages(fragmentName : String) : Array<Fragments.ImageEl>;
	public function getFirstImage() : Null<Fragments.ImageEl>;
	public function getFirstTitle() : Null<Fragments.StructuredText>;
	public function getFirstParagraph() : Null<Fragments.StructuredText>;	// ?
	public function getImageView(name : String, view : String) : Null<Fragments.ImageView>;
	public function getAllImageViews(name : String, view : String) : Array<Fragments.ImageView>;
	public function getTimestamp(name : String) : Null<Fragments.Timestamp>;
	public function getDate(name : String) : Null<Fragments.DateFragment>;
	public function getBoolean(name : String) : Bool;
	public function getText(name : String, ?after : String) : Null<String>; // (Many values according to lib, but returns string)
	public function getStructuredText(name : String) : Null<Fragments.StructuredText>;
	public function getLink(name : String) : Null<Fragments.LinkFragment>; // WebLink, DocumentLink, ImageLink
	public function getNumber(name : String) : Null<Fragments.Number>;
	public function getColor(name : String) : Null<Fragments.Color>;
	public function getGeoPoint(name : String) : Null<Fragments.GeoPoint>;
	public function getGroup(name : String) : Null<Fragments.Group>;
	public function getHtml(name : String, linkResolver : LinkResolver) : String;

	public function asHtml(linkResolver : LinkResolver) : String;
	public function asText(linkResolver : LinkResolver) : String;

	public function linkedDocuments() : Array<Fragments.DocumentLink>;
}