package prismic;

import prismic.Doc;

extern class PrismicResponse
{
	public var page(default, null) : Int;
	public var results_per_page(default, null) : Int;
	public var results_size(default, null) : Int;
	public var total_results_size(default, null) : Int;
	public var total_pages(default, null) : Int;
	public var next_page(default, null) : Null<String>;
	public var prev_page(default, null) : Null<String>;

	public var results(default, null) : Array<Doc>;
}
