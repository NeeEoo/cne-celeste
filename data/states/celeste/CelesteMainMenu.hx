import flixel.text.FlxText;
import flixel.FlxSprite;
import funkin.system.Paths;
import flixel.text.FlxTextBorderStyle;

var ref_img:FlxSprite;

var text_climb:FlxText;
var text_pico:FlxText;
var text_options:FlxText;
var text_credits:FlxText;
var text_exit:FlxText;

function create() {
    var tempbg = new FlxSprite().makeGraphic(1, 1, 0xFF666666);
    tempbg.scale.set(FlxG.width, FlxG.height);
    tempbg.updateHitbox();
    add(tempbg);

    ref_img = new FlxSprite().loadGraphic(Paths.image('- ref'));
    ref_img.setGraphicSize(FlxG.width, FlxG.height);
    ref_img.updateHitbox();
    ref_img.antialiasing = true;
    ref_img.screenCenter();
    add(ref_img);

    var baseX = 164;
    var offset = 53.5;

    text_climb = new FlxText(125, 260, 0, "CLIMB");
    text_pico = new FlxText(baseX, 332, 0, "PICO-8");
    text_options = new FlxText(baseX, text_pico.y + offset, 0, "Options");
    text_credits = new FlxText(baseX, text_options.y + offset, 0, "Credits");
    text_exit = new FlxText(baseX, text_credits.y + offset, 0, "Exit");

    for(text in [text_climb, text_pico, text_options, text_credits, text_exit]) {
        text.font = Paths.font('Renogare-Regular.otf');
        text.size = (text == text_climb) ? 45 : 30;
        text.size *= 2;
        text.scale.set(0.5, 0.5); // oh shit lmao look in dms
        text.updateHitbox();
        text.fieldWidth = (text.width + 10) * 2;
        text.alignment = "center";
        text.antialiasing = true;

        text.borderStyle = FlxTextBorderStyle.OUTLINE;
        text.borderSize = 2;
        text.borderColor = 0xFF000000;

        add(text);
        trace(text.text + " loaded");
    }
}

var ri = 0;
var r = [1, 0.5, 0];

// fun fact, this is the same code i used for funkscop menus
// oh shit!! god i love funkscop

function update() {
    ref_img.alpha = r[ri];
    if (FlxG.keys.justPressed.J)
        ri = (ri + 1) % r.length;

    if (FlxG.keys.justPressed.F4) // changing to f4 bc it don't work :(
        FlxG.switchState(new ModState("celeste/CelesteMainMenu"));

    if (FlxG.keys.justPressed.ESCAPE)
        FlxG.switchState(new MainMenuState());
}