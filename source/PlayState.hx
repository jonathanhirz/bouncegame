package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

class PlayState extends FlxState
{

	/**
	 * Function that is called up when to state is created to set it up.
	 */

	 public var scoreText:FlxText;
	 public var score:Int = 0;

	override public function create():Void
	{
		super.create();

		FlxG.mouse.visible = false;

		//FlxG.camera.bgColor = 0xffacbcd7;
		// trace() will show up in the console window
		FlxG.log.redirectTraces = false;

		var player:Player = new Player(FlxG.width/2, FlxG.height/2);
		add(player);

		// bottom platform
		var bottomPlatform:BottomPlatform = new BottomPlatform(0,450);
		add(bottomPlatform);

		var platform:Platform = new Platform(FlxG.width/2 - 50,400,100,20);
		add(platform);

		var platform:Platform = new Platform(40,300,100,20);
		add(platform);

		var platform:Platform = new Platform(FlxG.width/2 - 20,150,100,20);
		add(platform);

		scoreText = new FlxText(FlxG.width/2 - 50,20,150,"Score: " + score,18);
		add(scoreText);

	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();

		FlxG.collide();
	}
}