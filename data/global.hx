function update() {
    if (FlxG.keys.justPressed.F5)
        FlxG.resetState();

    if (FlxG.keys.justPressed.Q)
        FlxG.switchState(new ModState("CelesteMainMenu"));
}