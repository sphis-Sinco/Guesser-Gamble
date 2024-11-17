package;

import flixel.FlxState;

class PlayState extends FlxState
{
	public var choiceID_right:Int = 0;
	public var choiceID_wrong:Int = 1;

	public var choices_length:Int = 1;

	override public function new()
	{
		if (choices_length < 2)
			throw '[ERROR] choices_length is an invalid integer (should be 2 or higher)';

		super();
	}

	override public function create()
	{
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
