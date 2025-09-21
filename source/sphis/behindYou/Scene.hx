package sphis.behindYou;

class Scene
{
	public var id:String;
	public var chance_of_character_entering:Float;

	public var updateEvents:Array<(Float, Scene) -> Void> = [];

	public function new(id:String, ?chance_of_character_entering:Float = 50)
	{
		this.id = id;
		this.chance_of_character_entering = chance_of_character_entering;
	}

	public function clone():Scene
	{
		return new Scene(this.id, this.chance_of_character_entering);
	}

	public function update(elapsed:Float)
	{
		for (event in updateEvents)
			event(elapsed, this);
	}
}
