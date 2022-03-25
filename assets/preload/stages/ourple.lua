function onCreate()


	makeLuaSprite('stageblack', 'black', -520, -130);
	setLuaSpriteScrollFactor('stageblack', 1.0, 1.0);
	addLuaSprite('stageblack', false);

	makeLuaSprite('stagepurple', 'ourple', -520, -130);
	setLuaSpriteScrollFactor('stagepurple', 1.0, 1.0);
	addLuaSprite('stagepurple', false);

	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end