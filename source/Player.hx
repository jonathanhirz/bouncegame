package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxMath;

class Player extends FlxSprite
{
	public function new (X:Float, Y:Float)
	{
		super(X, Y);

		makeGraphic(20,20,0xff528546);
		acceleration.y = 500;

	}
	override public function update():Void
	{
		velocity.x = 0;
		var v:Float = 150;

		if (FlxG.keys.anyPressed(["LEFT", "A"]))
		{
			velocity.x -= v;
		}
		if (FlxG.keys.anyPressed(["RIGHT", "D"]))
		{
			velocity.x += v;
		}
		if(isTouching(flixel.FlxObject.FLOOR))
		{
			velocity.y = -acceleration.y;
			//FlxG.camera.shake(0.01,0.2);
			//trace("bounce!");
		}

		super.update();

		x = FlxMath.bound(x, 0, FlxG.width - width);
	}

	public function playerBounce():Void
	{
		acceleration.y = -100;
	}
}