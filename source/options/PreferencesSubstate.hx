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
		title = 'Custom Options';
		rpcTitle = 'Visuals & UI Settings Menu'; //for Discord Rich Presence

		var option:Option = new Option('Score Type:',                                                                  
			"What should be the score type?",
                        'scoreType',
                        'string',
                        'Psych Engine',
                        ['Psych Engine', 'Kade Engine', 'Disabled']);
                addOption(option);

		var option:Option = new Option('Memory Counter',
			'If unchecked, disables memory counter.',
                        'memoryCounter',
                        'bool',
                        true);
                addOption(option);
		option.onChange = onChangeMemoryCounter;

		var option:Option = new Option('Health Counter',
                        'If unchecked, hides the health counter.',
                        'healthCounter',
                        'bool',
                        true);
                addOption(option);
		
		var option:Option = new Option('Time Bar:',
			"What should the Time Bar display?",
			'timeBarType',
			'string',
			'Time Left',
			['Time Left', 'Time Elapsed', 'Song Name', 'Disabled']);
		addOption(option);


		var option:Option = new Option('Judgements',
                        'If unchecked, hides judgements.',
                        'judgements',
                        'bool',
                        true);
                addOption(option);

		var option:Option = new Option('No Antimash',
                        'If checked, disables antimash.',
                        'noAntimash',
                        'bool',
                        true);
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
