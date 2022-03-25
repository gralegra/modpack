package;

import flixel.FlxG;
import openfl.utils.Assets;
import lime.utils.Assets as LimeAssets;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import openfl.utils.Assets;
import flixel.util.FlxColor;

using StringTools;

class CoolUtil
{
	// [Difficulty name, Chart file suffix]
	public static var difficultyStuff:Array<Dynamic> = [
		['Easy', '-easy'],
		['Normal', ''],
		['Hard', '-hard']
	];

	public static function difficultyString():String
	{
		return difficultyStuff[PlayState.storyDifficulty][0].toUpperCase();
	}

	public static function boundTo(value:Float, min:Float, max:Float):Float {
		var newValue:Float = value;
		if(newValue < min) newValue = min;
		else if(newValue > max) newValue = max;
		return newValue;
	}

	public static function coolTextFile(path:String):Array<String>
	{
		var daList:Array<String> = [];
		if(Assets.exists(path)) daList = Assets.getText(path).trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}

	public static function smoothColorChange(from:FlxColor, to:FlxColor, speed:Float = 0.045):FlxColor
        {

            var result:FlxColor = FlxColor.fromRGBFloat
            (
                CoolUtil.coolLerp(from.redFloat, to.redFloat, speed), //red

                CoolUtil.coolLerp(from.greenFloat, to.greenFloat, speed), //green

                CoolUtil.coolLerp(from.blueFloat, to.blueFloat, speed) //blue
            );

            return result;
}
	public static function camLerpShit(a:Float):Float
        {
                return FlxG.elapsed / 0.016666666666666666 * a;
        }

        public static function coolLerp(a:Float, b:Float, c:Float):Float
        {
                return a + CoolUtil.camLerpShit(c) * (b - a);
        }

	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		var dumbArray:Array<Int> = [];
		for (i in min...max)
		{
			dumbArray.push(i);
		}
		return dumbArray;
	}

	//uhhhh does this even work at all? i'm starting to doubt
	public static function precacheSound(sound:String, ?library:String = null):Void {
		if(!Assets.cache.hasSound(Paths.sound(sound, library))) {
			FlxG.sound.cache(Paths.sound(sound, library));
		}
	}

	public static function browserLoad(site:String) {
		#if linux
		Sys.command('/usr/bin/xdg-open', [site]);
		#else
		FlxG.openURL(site);
		#end
	}
}
