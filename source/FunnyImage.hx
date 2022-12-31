#if sys
package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;
import lime.app.Application;
#if windows
import Discord.DiscordClient;
#end
import openfl.display.BitmapData;
import openfl.utils.Assets;
import haxe.Exception;
import flixel.tweens.FlxEase;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
#if cpp
import sys.FileSystem;
import sys.io.File;
#end

using StringTools;

class FunnyImage extends MusicBeatState
{
	public static var bitmapData:Map<String,FlxGraphic>;
	public static var bitmapData2:Map<String,FlxGraphic>;

	var images = [];
	var music = [];

	var shitz:FlxText;

	override function create()
	{
		FlxG.mouse.visible = false;

		FlxG.worldBounds.set(0,0);

		bitmapData = new Map<String,FlxGraphic>();
		bitmapData2 = new Map<String,FlxGraphic>();

		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('loadingScreens/5YEARSsmall'));
		menuBG.screenCenter();
		add(menuBG);

		shitz = new FlxText(20, 20, 5000, "Happy 5 years to Blu's Youtube channel!", 12);
		shitz.scrollFactor.set();
		shitz.setFormat("VCR OSD Mono", 35, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(shitz);

		#if cpp
		for (i in FileSystem.readDirectory(FileSystem.absolutePath("assets/shared/images/characters")))
		{
			if (!i.endsWith(".png"))
				continue;
			images.push(i);
		}

		for (i in FileSystem.readDirectory(FileSystem.absolutePath("assets/songs")))
		{
			music.push(i);
		}
		#end

		new FlxTimer().start(0.25, function(tmr:FlxTimer)
				{
					FlxG.sound.play(Paths.sound('ruby2'), 1);
				});

		new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					FlxG.sound.play(Paths.sound('aniversary'), 0.4);
				});
		
		new FlxTimer().start(6, function(tmr:FlxTimer)
				{	
					FlxG.sound.play(Paths.sound('ruby3'), 1);
					MusicBeatState.switchState(new TitleState());
				});


		// sys.thread.Thread.create(() -> {
		// 	cache();
		// });

		super.create();
	}

	override function update(elapsed) 
	{
		super.update(elapsed);
	}

}
#end