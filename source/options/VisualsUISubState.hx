package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class VisualsUISubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Visuals and UI';
		rpcTitle = 'Visuals & UI Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Note Splashes',
			"If unchecked, hitting \"Sick!\" notes won't show particles.",
			'noteSplashes',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Score Type:',
			"What should the score be like?",
                        'scoreType',
                        'string',
                        'Kade Engine',
                        ['Psych Engine', 'Kade Engine', 'Disabled']);
                addOption(option);

		var option:Option = new Option('Memory Counter',
			'If checked, enables memory counter.',
                        'memoryCounter',
                        'bool',
                        false);
                addOption(option);
		option.onChange = onChangeMemoryCounter;
/*
		var option:Option = new Option('Dynamic Cam',
                        'If checked, enables dynamic cam movement it only works with vanilla FNF!.',
                        'dynamicCam',
                        'bool',
                        false);
                addOption(option); //not working
*/
		var option:Option = new Option('Play Hit Sounds',
                        'If checked, enables hit sounds.',
                        'playHitSounds',
                        'bool',
                        false);
                addOption(option);

		var option:Option = new Option('Icon Boping',
                        'If checked, enables icon Boping.',
                        'iconBoping',
                        'bool',
                        false);
                addOption(option);

		var option:Option = new Option('Hide HUD',
			'If checked, hides most HUD elements.',
			'hideHud',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Health Counter',
                        'If checked, enables the health counter.',
                        'healthCounter',
                        'bool',
                        false);
                addOption(option);
		
		var option:Option = new Option('Time Bar:',
			"What should the Time Bar display?",
			'timeBarType',
			'string',
			'Time Left',
			['Time Left', 'Time Elapsed', 'Song Name', 'Disabled']);
		addOption(option);

		var option:Option = new Option('Flashing Lights',
			"Uncheck this if you're sensitive to flashing lights!",
			'flashing',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Camera Zooms',
			"If unchecked, the camera won't zoom in on a beat hit.",
			'camZooms',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Judgements',
                        'If unchecked, hides judgements.',
                        'judgements',
                        'bool',
                        false);
                addOption(option);
		
		var option:Option = new Option('KE Timebar',
                        'If checked, uses the KE timebar.',
                        'keTimeBar',
                        'bool',
                        false);
                addOption(option);

		var option:Option = new Option('Health Bar Opacity',
			'How Opaque should the health bar and icons be.',
			'healthBarAlpha',
			'percent',
			1);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		addOption(option);

		var option:Option = new Option('Arrows Opacity',
                        'How Opaque should the arrows be.',
			'arrowOpacity',
			'percent',
                        1);
                option.scrollSpeed = 1.6;
                option.minValue = 0.0;
                option.maxValue = 1;
                option.changeValue = 0.1;
		option.decimals = 1;
                addOption(option);
/*
		var option:Option = new Option('Lane Opacity',
                        'How Opaque should the lane underlay be.',
                        'laneOpacity',
                        'percent',
                        1);
                option.scrollSpeed = 1.6;
                option.minValue = 0.0;
                option.maxValue = 1;
                option.changeValue = 0.1;
                option.decimals = 1;
                addOption(option);
		
		var option:Option = new Option('Enemy Lane Opacity',
                        'How Opaque should the opponent lane be.',
                        'opponentLaneOpacity',
                        'percent',
                        1);
                option.scrollSpeed = 1.6;
                option.minValue = 0.0;
                option.maxValue = 1;
                option.changeValue = 0.1;
                option.decimals = 1;
                addOption(option);
*/
                var option:Option = new Option('Enemy Arrows Opacity',
                        'How Opaque should the opponent arrows be.',
                        'opponentArrowOpacity',
                        'percent',
                        1);
                option.scrollSpeed = 1.6;
                option.minValue = 0.0;
                option.maxValue = 1;
                option.changeValue = 0.1;
                option.decimals = 1;
                addOption(option);

		var option:Option = new Option('FPS Counter',
			'If unchecked, hides FPS Counter.',
			'showFPS',
			'bool',
			true);
		addOption(option);
		option.onChange = onChangeFPSCounter;

		super();
	}

	function onChangeFPSCounter()
	{
		if(Main.fpsVar != null)
			Main.fpsVar.visible = ClientPrefs.showFPS;
	}

	function onChangeMemoryCounter()
        {
                if(Main.memoryCounter != null)
                        Main.memoryCounter.visible = ClientPrefs.memoryCounter;
        }	
}
