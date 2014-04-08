package ;

import openfl.Assets;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxMath;
import flixel.util.FlxRandom;

class Platform extends FlxSprite
{
	public var scoreState:PlayState = cast FlxG.state;

	public function new (X:Float, Y:Float, Width: Int, Height:Int)
	{
		super(X, Y);

		makeGraphic(Width,Height,0xff525252);
		immovable = true;

	}
	override public function update():Void
	{
		if(isTouching(flixel.FlxObject.CEILING))
		{
			FlxG.sound.play("assets/sounds/bounce" + Reg.SoundExtension,1,false);
			x = FlxRandom.intRanged(20,FlxG.width - 120);
			y = FlxRandom.intRanged(60,FlxG.height - 80);
			scoreState.score += 1;
			scoreState.scoreText.text = "Score: " + scoreState.score;
		}
		super.update();
	}
}