package;

import flixel.FlxG;
import flixel.FlxState;
import sphis.behindYou.Scene;

class PlayState extends FlxState
{
	public var sceneList:Map<String, Scene> = ['room' => new Scene('room', 25), 'backroom' => new Scene('backroom')];

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

				switch (currentCharacterScene.id)
				{
					case 'backroom':
						chance = 0;
					default:
						trace(currentCharacterScene.id);
				}

				scene.chance_of_character_entering = chance;
			});
	}

	public function new()
	{
		super();

		setScene('room');
		currentCharacterScene = getScene('backroom');
	}

	override public function create()
	{
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		currentScene.update(elapsed);

		var scenesToCheck = [];
		for (key => value in sceneList)
		{
			if (currentScene.id != value.id)
				scenesToCheck.push(value);
		}

		for (scene in scenesToCheck)
		{
			if (FlxG.random.bool(scene.chance_of_character_entering) && currentCharacterScene.id != scene.id)
				currentCharacterScene = getScene(scene.id);
			else
				trace(scene.id + ' failed to get character');
		}
	}
}
