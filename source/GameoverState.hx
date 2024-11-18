package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class GameoverState extends FlxState
{
	public var gameoverText:FlxText = new FlxText("Game over", 32);
	public var coinText:FlxText = new FlxText("Insert 1 coin to try again", 16);

	override public function new()
	{
		trace('GameoverState init');

		gameoverText.screenCenter();
		gameoverText.y -= gameoverText.size * 5;

		coinText.screenCenter(X);
		coinText.y = gameoverText.y + coinText.height * 2;

		super();
	}

	override public function create()
	{
		add(gameoverText);
		add(coinText);
		FlxG.camera.fade(FlxColor.BLACK, 0.4, true);

		super.create();
	}

	public function gameoverMenu() {}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}