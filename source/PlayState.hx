package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	public var choiceID_wrong:Int = 0;
	public var choiceID_right:Int = 1;

	public var choices_length:Int = 30;

	public var choices_array:Array<Int> = [];
	public var choices:FlxTypedGroup<FlxSprite> = new FlxTypedGroup<FlxSprite>();

	override public function new()
	{
		// My mouse was from fnf lmao
		FlxG.mouse.unload();

		if (choices_length < 2)
			throw '[ERROR] choices_length is an invalid integer (should be 2 or higher)';

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

			choice.y = 16 + (choiceColumn * (choice.graphic.height + padding));

			#if debug
			if (choice.ID == 1)
				choice.makeGraphic(choice.graphic.width, choice.graphic.height, FlxColor.LIME);
			#end

			choices.add(choice);

			choiceAm++;
		}

		super();
	}

	override public function create()
	{
		add(choices);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justReleased.R)
			FlxG.resetState();

		super.update(elapsed);
	}
}
