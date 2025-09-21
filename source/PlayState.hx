package;

import flixel.FlxState;
import sphis.behindYou.Scene;

class PlayState extends FlxState
{
	public var sceneList:Map<String, Scene> = ['room' => new Scene('room')];
	public var currentScene:Scene;

	public function setScene(id:String)
	{
		this.currentScene = sceneList?.get(id).clone() ?? new Scene('null', 0);

		if (id == 'room')
			currentScene.updateEvents.push((elapsed, scene) ->
			{
				var chance = scene.clone().chance_of_character_entering;

				scene.chance_of_character_entering = chance;
			});
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
		currentScene.update(elapsed);
	}
}
