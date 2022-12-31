package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class ImportantNoteState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			"Heya! It's me, Blu, just wanted to let you know\n
			that I don't know much about coding, and am not that good at it.\n
			So please note that this mod may be a little buggy at times.\n
			And may also crash randomly for some reason...?\n
			Press ENTER to continue.\n
			\n
			Thank you for playing!",
			32);
		warnText.setFormat("VCR OSD Mono", 30, FlxColor.WHITE, CENTER);
		warnText.screenCenter(X);
		warnText.screenCenter(Y);
		add(warnText);
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if(controls.BACK) {
				leftState = true;
			}

			else if(controls.ACCEPT) {
				leftState = true;
			}

			if(leftState)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxTween.tween(warnText, {alpha: 0}, 0.25, {
					onComplete: function (twn:FlxTween) {
						MusicBeatState.switchState(new TitleState());
					}
				});
			}
		}
		super.update(elapsed);
	}
}
