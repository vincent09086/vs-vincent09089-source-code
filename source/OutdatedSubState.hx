package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;

	public static var needVer:String = "IDFK LOL";
	public static var currChanges:String = "dk";
	
	private var bgColors:Array<String> = [
		'#314d7f',
		'#4e7093',
		'#70526e',
		'#594465'
	];
	private var colorRotation:Int = 1;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('week54prototype', 'shared'));
		bg.scale.x *= 1.55;
		bg.scale.y *= 1.55;
		bg.screenCenter();
		add(bg);
		
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"Hey You!\nYes You."
			+ "\nspell kid amogus backwards"
			+ "\n\nPress ESCAPE to ignore this",
			32);
		
		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);
		
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			FlxTween.color(bg, 2, bg.color, FlxColor.fromString(bgColors[colorRotation]));
			if(colorRotation < (bgColors.length - 1)) colorRotation++;
			else colorRotation = 0;
		}, 0);
		
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{

		}, 0);
		
		new FlxTimer().start(0.8, function(tmr:FlxTimer)
		{
			
		}, 0);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			FlxG.openURL("https://www.youtube.com/watch?v=dQw4w9WgXcQ-" + needVer);
		}
		if (controls.BACK)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
