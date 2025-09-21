package;

import flixel.FlxState;
import sphis.behindYou.Scene;

class PlayState extends FlxState
{
	public var sceneList:Map<String, Scene> = ['room' => new Scene('room'), 'backroom' => new Scene('backroom')];

	public var currentScene:Scene;
	public var currentCharacterScene:Scene;

	public function getScene(id:String):Scene
	{
		return sceneList?.get(id).clone() ?? new Scene('null', 0);
	}

	public function setScene(id:String)
	{
		this.currentScene = getScene(id);

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
