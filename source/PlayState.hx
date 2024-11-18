package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	public var choiceID_wrong:Int = 0;
	public var choiceID_right:Int = 1;

	public static var level:Int = 1;
	public var choices_length:Int = 15;

	public var choices_array:Array<Int> = [];
	public var choices:FlxTypedGroup<FlxSprite> = new FlxTypedGroup<FlxSprite>();

	public var lives:Int = 5;
	public var livesText:FlxText = new FlxText();

	public var dead:Bool = false;
	public var gameoverState:Bool = false;

	public var blackBG:FlxSprite = new FlxSprite();

	override public function new()
	{

		if (choices_length < 2)
			throw '[ERROR] choices_length is an invalid integer (should be 2 or higher)';

		switch (level)
		{
			case 5:
				trace('Secret Level!');
				choices_length = 150;

			case 4:
				choices_length = 60;

			case 3:
				choices_length = 45;

			case 2:
				choices_length = 30;

			default:
				choices_length = 15;
		}

		refreshChoices();

		livesText = new FlxText(10, 10);
		livesText.size = 16;

		blackBG.alpha = 0;
		blackBG.makeGraphic(800, 800, 0xFFFFFF);
		blackBG.screenCenter();

		super();
	}

	override public function create()
	{
		FlxG.mouse.useSystemCursor = true;
		
		add(choices);
		add(livesText);
		add(blackBG);
		FlxG.camera.fade(FlxColor.BLACK, 0.4, true);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		livesText.text = 'Lives: $lives';

		if (FlxG.keys.justReleased.R)
			FlxG.resetState();

		if (FlxG.mouse.justReleased && !dead)
		{
			var clickFound:Bool = false;

			for (choice in choices.members)
			{
				if (FlxG.mouse.overlaps(choice) && !clickFound)
				{
					if (choice.ID == choiceID_right)
					{
						clickFound = true;
						refreshChoices();
						continue;
					}
					else if (choice.ID == choiceID_wrong)
					{
						clickFound = true;
						lives--;

						if (lives < 1)
						{
							lives = 0;
							trace('DIED!');
							livesText.text = 'Lives: $lives';
							dead = true;
						}
						// trace('aw');
					}
				}
			}
		}

		if (dead && !gameoverState)
		{
			gameoverState = true;
			FlxG.camera.fade(FlxColor.BLACK, 0.4, false, function()
			{
				FlxG.switchState(new GameoverState());
			});
		}

		super.update(elapsed);
	}
	public function refreshChoices()
	{
		choices_array = [];
		#if debug
		trace('cleared choices_array');
		#end

		if (choices.members.length > 0)
			for (i in 0...choices.members.length)
			{
				choices.members.remove(choices.members[i]);
			}

		trace(choices.members);

		#if debug
		trace('cleared choices.members');
		#end


		var index:Int = 0;
		while (index < choices_length)
		{
			var random:Float = Math.random();
			if ((index == (choices_length - 1) || random >= 0.5) && !choices_array.contains(1))
				choices_array.push(choiceID_right);
			else
				choices_array.push(choiceID_wrong);

			index++;
		}

		trace(choices_array);

		var choiceAm:Int = 0;
		var choiceAmMAX:Int = 15;
		var choiceColumn:Int = 0;
		var padding:Int = 8;

		for (i in 0...choices_array.length)
		{
			var choice:FlxSprite = new FlxSprite().makeGraphic(32, 32, FlxColor.RED);
			choice.ID = choices_array[i];

			if (choiceAm == choiceAmMAX)
			{
				choiceColumn++;
				choiceAm = 0;
			}

			choice.x = 16 + ((i - (choiceColumn * choiceAmMAX)) * (choice.graphic.width + padding));

			choice.y = FlxG.height - (64 - (choiceColumn * (choice.graphic.height + padding)));

			#if display_answer
			if (choice.ID == 1)
				choice.makeGraphic(choice.graphic.width, choice.graphic.height, FlxColor.LIME);
			#end

			choices.add(choice);

			choiceAm++;
		}
		#if debug
		trace('Refreshed Choices');
		#end
	}
}
