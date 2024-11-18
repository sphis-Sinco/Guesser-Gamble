package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	public var titleText:FlxText = new FlxText("Guesser Gameble v1", 32);
	public var coinText:FlxText = new FlxText("Insert 1 coin to start", 16);

	public var startBtn:FlxButton;

	override public function new()
	{
		titleText.screenCenter();
		titleText.y -= titleText.size * 5;

		coinText.screenCenter(X);
		coinText.y = titleText.y + coinText.height * 2;

		startBtn = new FlxButton(0, 0, "Start", start);
		startBtn.screenCenter();
		// startBtn.y -= startBtn.height * 2;

		super();
	}

	override public function create()
	{
		add(titleText);
		add(coinText);
		add(startBtn);

		FlxG.camera.fade(FlxColor.BLACK, 0.4, true);
        
		super.create();
	}

	public function start()
	{
		trace('START');
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
