package;

import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var choiceID_right:Int = 0;
	public var choiceID_wrong:Int = 1;

	public var choices_length:Int = 2;
	public var choices_array:Array<Int> = [];

	override public function new()
	{
		if (choices_length < 2)
			throw '[ERROR] choices_length is an invalid integer (should be 2 or higher)';

		var index:Int = 1;
		while (index < choices_length)
		{
			var random:Int = Std.int(Math.random());
			if ((index == (choices_length - 1) || random == 1) && !choices_array.contains(1))
				choices_array.push(1);
			else
				choices_array.push(0);

			index++;
		}

		trace(choices_array);

		super();
	}

	override public function create()
	{
		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justReleased.R)
			FlxG.resetState();

		super.update(elapsed);
	}
}
