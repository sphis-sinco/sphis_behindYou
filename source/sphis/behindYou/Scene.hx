package sphis.behindYou;

class Scene
{
	public var id:String;

	public function new(id:String)
	{
		this.id = id;
	}
	public function clone():Scene
	{
		return new Scene(this.id);
	}
}
