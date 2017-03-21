package prismic;

extern class Doc extends WithFragments
{
	public var id(default, null) : String;
	public var uid(default, null) : Null<String>;
	public var type(default, null) : String;
	public var href(default, null) : String;
	public var tags(default, null) : Array<String>;

	public var data(default, null) : Dynamic;
	public var fragments(default, null) : Array<Dynamic>;

	public function getSliceZone(name : String) : Null<Fragments.SliceZone>;
}

extern class GroupDoc extends WithFragments
{
	public var data(default, null) : Dynamic;
	public var fragments(default, null) : Array<Dynamic>;
}