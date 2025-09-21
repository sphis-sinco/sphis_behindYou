package;

import flixel.FlxState;
import sphis.behindYou.Scene;

class PlayState extends FlxState
{
	public var sceneList:Map<String, Scene> = ['room' => new Scene('room')];
	public var scene:Scene;

	public function setScene(id:String)
	{
		this.scene = sceneList?.get(id) ?? new Scene('null');
	}

	public function new()
	{
		super();

		setScene('room');
	}

	override public function create()
	{
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
