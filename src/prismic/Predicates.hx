package prismic;

@:jsRequire('prismic.io', 'Predicates')
extern class Predicates
{
	static function at(fragment : String, value : String) : Predicate;
	static function not(fragment : String, value : String) : Predicate;
	static function missing(fragment : String) : Predicate;
	static function has(fragment : String) : Predicate;
	static function any(fragment : String, values : Array<String>) : Predicate;
	@:native("in") static function _in(fragment : String, values : Array<String>) : Predicate;
	static function fulltext(fragment : String, value : String) : Predicate;
	static function similar(documentId : String, maxResults : Int) : Predicate;
	static function gt(fragment : String, value : Float) : Predicate;
	static function lt(fragment : String, value : Float) : Predicate;
	static function inRange(fragment : String, before : Float, after : Float) : Predicate;
	static function dateBefore(fragment : String, before : Date) : Predicate;
	static function dateAfter(fragment : String, after : Date) : Predicate;
	static function dateBetween(fragment : String, before : Date, after : Date) : Predicate;
	static function dayOfMonth(fragment : String, day : Int) : Predicate;
	static function dayOfMonthAfter(fragment : String, day : Int) : Predicate;
	static function dayOfMonthBefore(fragment : String, day : Int) : Predicate;
	static function dayOfWeek(fragment : String, day : Int) : Predicate;
	static function dayOfWeekAfter(fragment : String, day : Int) : Predicate;
	static function dayOfWeekBefore(fragment : String, day : Int) : Predicate;
	static function month(fragment : String, month : Int) : Predicate;
	static function monthBefore(fragment : String, month : Int) : Predicate;
	static function monthAfter(fragment : String, month : Int) : Predicate;
	static function year(fragment : String, year : Int) : Predicate;
	static function hour(fragment : String, hour : Int) : Predicate;
	static function hourBefore(fragment : String, hour : Int) : Predicate;
	static function hourAfter(fragment : String, hour : Int) : Predicate;
	static function near(fragment : String, latitude : Float, longitude : Float, radius : Float) : Predicate;

	static function toQuery(predicate : Predicate) : String;
}

abstract Predicate(Array<String>)
{

}
