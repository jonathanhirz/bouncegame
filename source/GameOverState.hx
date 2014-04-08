package;

import openfl.Assets;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class GameOverState extends FlxState
{
	public var scoreText:FlxText;
	public var score:Int = 0;
	public var scoreState:PlayState = cast FlxG.state;
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		super.create();

		FlxG.sound.play("assets/sounds/death.wav");

		score = scoreState.score;
		scoreText = new FlxText(FlxG.width/2 - 50,20,150,"Score: " + score,18);
		add(scoreText);

		add(new FlxText(15,FlxG.height/2 - 100,640,"GAME OVER", 90));
		add(new FlxText(FlxG.width/2 - 100,FlxG.height/2 + 50,300,"SPACE to restart",20));
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
		if(FlxG.keys.anyPressed(["SPACE"]))
		{
			FlxG.switchState(new PlayState());
		}
		super.update();
	}
}