package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	public var titleText:FlxText = new FlxText("Guesser Gameble", 32);
	public var coinText:FlxText = new FlxText("Insert 1 coin to start", 16);

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
