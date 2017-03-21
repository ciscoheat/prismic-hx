package prismic;

@:forward
abstract Error(js.Error) from js.Error to js.Error 
{
    public var status(get, never) : Int;
    function get_status() return Reflect.field(this, "status");
}