package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxMath;

class BottomPlatform extends FlxSprite
{
	public function new (X:Float, Y:Float)
	{
		super(X, Y);

		// SPIKES!!
		//makeGraphic(Width,Height,0xFF000000);
		loadGraphic("assets/images/spikes.png");
		immovable = true;

	}
	override public function update():Void
	{
		if(isTouching(flixel.FlxObject.CEILING))
		{
			// player dies
			// load gameOverScene
			FlxG.switchState(new GameOverState());
		}
		super.update();
	}
}