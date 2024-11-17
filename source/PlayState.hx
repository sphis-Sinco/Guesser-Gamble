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

	public var choices_length:Int = 10;

	public var choices_array:Array<Int> = [];
	public var choices:FlxTypedGroup<FlxSprite> = new FlxTypedGroup<FlxSprite>();

	override public function new()
	{
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
		var choiceRow:Int = 0;
		var padding:Int = 8;
		for (i in 0...choices_array.length)
		{
			var choice:FlxSprite = new FlxSprite().makeGraphic(32, 32, FlxColor.RED);

			if (choiceAm == 4)
			{
				choiceRow++;
			}

			choice.x = 16 + ((i - (choiceRow * 4)) * (choice.width + padding));
			choice.y = 16 + (choiceRow * (choice.height + padding));

			if (choices_array[i] == 1)
				choice.color = FlxColor.LIME;

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
