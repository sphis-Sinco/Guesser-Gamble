package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class GameoverState extends FlxState
{
	public var gameoverText:FlxText = new FlxText("Game over", 32);
	public var coinText:FlxText = new FlxText("Insert 1 coin to try again", 16);

	public var retryBtn:FlxButton;

	override public function new()
	{
		trace('GameoverState init');

		gameoverText.screenCenter();
		gameoverText.y -= gameoverText.size * 5;

		coinText.screenCenter(X);
		coinText.y = gameoverText.y + coinText.height * 2;

		retryBtn = new FlxButton(0, 0, "Retry", reset);
		retryBtn.screenCenter();
		retryBtn.y -= retryBtn.width * 2;

		super();
	}

	override public function create()
	{
		add(gameoverText);
		add(coinText);
		add(retryBtn);
		FlxG.camera.fade(FlxColor.BLACK, 0.4, true);

		super.create();
	}

	public function reset()
	{
		trace('RETRY');
		FlxG.camera.fade(FlxColor.BLACK, 0.4, false, function()
		{
			FlxG.switchState(new PlayState());
		});
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}