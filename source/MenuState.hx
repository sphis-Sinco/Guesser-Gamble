package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	override public function create()
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.4, true);
        
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
