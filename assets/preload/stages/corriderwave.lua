function onCreate()
	-- background shit
	makeLuaSprite('bambersansbg', 'bambersansbg', -600, -300);
	setScrollFactor('bambersansbg', 0.9, 0.9);
	
	function onCreate() 
    makeLuaSprite('BGWAVER', 'BGWAVER', -500, -100);
    setLuaSpriteScrollFactor('BGWAVER', 0.9, 0.9); 
    addGlitchEffect('BGWAVER', 

	addLuaSprite('bambersansbg', false);
	addLuaSprite('BGWAVER', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end