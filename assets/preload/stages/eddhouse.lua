function onCreate()
	precacheImage('DoorOpen')
	precacheImage('Matt')
	precacheImage('Tom')
	precacheImage('Eduardo')
	precacheImage('EduardoCUTSCENE')
	precacheImage('Mark')
	precacheImage('John')
	precacheImage('character/EddSide')
	precacheImage('character/DEdd')
	makeAnimationList();
	-- background shit
	makeLuaSprite('sky', 'SkyBox', -1790, -800);
	setScrollFactor('sky', 0.1, 0.5);
	
	makeLuaSprite('cloud', 'Clouds', -2590, -500);
	setScrollFactor('cloud', 0.1, 0.3);
	setProperty('cloud.velocity.x', math.random(5, 15));
	
	makeLuaSprite('houses', 'HousesAndFloor', -1790, -600);
	setScrollFactor('houses', 1, 1);
	
	if not lowQuality then
		makeAnimatedLuaSprite('doorOpen', 'DoorOpen', 597, 315); -- from that door on Hard comes up Matt with Tom
		addAnimationByPrefix('doorOpen', 'open', 'Door Opening', 12, false)
		setScrollFactor('doorOpen', 1, 1);
		setProperty('doorOpen.alpha', 0);
		scaleObject('doorOpen', 1.5, 1.5);
	
		makeLuaSprite('city', 'SecondParalax', -1290, -500);
		setScrollFactor('city', 0.65, 0.65);
		scaleObject('city', 0.8, 0.8);
		
		makeAnimatedLuaSprite('matt', 'EduardoBG', 560, 245); -- matt !!
		addAnimationByPrefix('matt', 'walk', 'EduardoWalks', 24, true)
		addAnimationByPrefix('matt', 'idle', 'EduardoIdol', 24, false)
		setScrollFactor('matt', 1, 1);
		setProperty('matt.alpha', 0);
		scaleObject('matt', 0.75, 0.75);
		
		makeAnimatedLuaSprite('tom', 'EduardoBG', 610, 245); -- tom !!
		addAnimationByPrefix('tom', 'walk', 'EduardoWalks', 24, true)
		addAnimationByPrefix('tom', 'idle', 'EduardoIdol', 24, true)
		setScrollFactor('tom', 1, 1);
		setProperty('tom.alpha', 0);
		scaleObject('tom', 0.75, 0.75);
		
		makeAnimatedLuaSprite('john', 'characters/Eduardo', -915, 205); -- john
		addAnimationByPrefix('john', 'idle', 'EduardoIdle', 24, false)
		addAnimationByPrefix('john', 'well', 'EduardoWell', 24, false)
		setScrollFactor('john', 1, 1);
		setProperty('john.alpha', 0);
		scaleObject('john', 0.9, 0.9);
		
		makeAnimatedLuaSprite('mark', 'characters/Eduardo', -760, 245); -- mark
		addAnimationByPrefix('mark', 'idle', 'EduardoIdle', 24, false)
		addAnimationByPrefix('mark', 'well', 'EduardoWell', 24, false)
		setScrollFactor('mark', 1, 1);
		setProperty('mark.alpha', 0);
		scaleObject('mark', 0.8, 0.8);
		
		makeLuaSprite('car', 'Car', -1790, -600);
		setScrollFactor('car', 1.15, 1.15);
		
		makeLuaSprite('plane', 'Plane', -890, 0);
		setScrollFactor('plane', 0.2, 0.6);
	end
	
	makeLuaSprite('fence', 'Fence', -1790, -600);
	setScrollFactor('fence', 1, 1);
		
	makeAnimatedLuaSprite('eduar', 'characters/Eduardo', -1080, 125); -- eduardo
	addAnimationByPrefix('eduar', 'idle', 'EduardoIdle', 24, false)
	addAnimationByPrefix('eduar', 'singLEFT', 'EduardoLeft', 24, false)
	addAnimationByPrefix('eduar', 'singDOWN', 'EduardoDown', 24, false)
	addAnimationByPrefix('eduar', 'singUP', 'EduardoUp', 24, false)
	addAnimationByPrefix('eduar', 'singRIGHT', 'EduardoRight', 24, false)
	addAnimationByPrefix('eduar', 'well', 'EduardoWell', 24, false)
	setScrollFactor('eduar', 1, 1);
	setProperty('eduar.alpha', 0);

	addLuaSprite('sky', false); --bg
	addLuaSprite('cloud', false);
	addLuaSprite('plane', false);
	addLuaSprite('city', false);
	addLuaSprite('houses', false);
	addLuaSprite('doorOpen', false);
	
	addLuaSprite('mark', false); --dumbasses
	addLuaSprite('john', false);
	addLuaSprite('eduar', false);
	addLuaSprite('eduarC', false);
	addLuaSprite('fence', false); --fence lol
	
	addLuaSprite('matt', false); -- matt
	addLuaSprite('tom', false); --tom
	
	addLuaSprite('car', true);
end

function onStepHit()
	if curStep == 144 then -- tord plane comin
		doTweenX('PlaneTweenX', 'plane', 1600, 25);
	end
	if curStep == 272 then -- matt coming up
		objectPlayAnimation('doorOpen', 'open', true)
		setProperty('doorOpen.alpha', 1);
		runTimer('doorGoesInvis', 1, 1)
		setProperty('matt.alpha', 1);
		doTweenX('MattTweenX', 'matt', 10, 1.9);
		function onTimerCompleted(tag, loops, loopsLeft)
			if tag == 'doorGoesInvis' then
				setProperty('doorOpen.alpha', 0);
			end
		end
	end
	if curStep == 416 then -- tom coming up
		setProperty('doorOpen.alpha', 1);
		objectPlayAnimation('doorOpen', 'open', true)
		runTimer('doorGoesInvis', 1, 1)
		setProperty('tom.alpha', 1);
		setProperty('tom.flipX', true);
		doTweenX('tomTweenX', 'tom', 1390, 4.8);
		function onTimerCompleted(tag, loops, loopsLeft)
			if tag == 'doorGoesInvis' then
				setProperty('doorOpen.alpha', 0);
			end
		end
	end
	if curStep == 928 then -- well
		setProperty('eddI.visible', true)
		objectPlayAnimation('eduar', 'well', true)
		doTweenAlpha('SkyTweenAlpha', 'sky', 0.9, 0.2);
		doTweenZoom('ZoominToNeighbours', 'camGame', 0.75, 0.2);
	end
	if curStep == 932 then -- well
		objectPlayAnimation('eduar', 'well', true)
		doTweenAlpha('SkyTweenAlpha2', 'sky', 0.8, 0.2);
		doTweenZoom('ZoominToNeighbours2', 'camGame', 0.8, 0.2);
	end
	if curStep == 936 then -- well
		objectPlayAnimation('eduar', 'well', true)
		doTweenAlpha('SkyTweenAlpha3', 'sky', 0.7, 0.2);
		doTweenZoom('ZoominToNeighbours3', 'camGame', 0.9, 0.2);
		runTimer('SkyToNormal', 1, 1)
		function onTimerCompleted(tag, loops, loopsLeft)
			if tag == 'SkyToNormal' then
				doTweenAlpha('SkyTweenAlpha4', 'sky', 1, 2);
			end
		end
	end
end -- hello im serdzhant

function onBeatHit()
	if curBeat % 2 == 0 and curStep > 289 and curStep < 912 then
		objectPlayAnimation('matt', 'idle', true);
	end
	if curBeat % 2 == 0 and curStep > 478 then
		objectPlayAnimation('tom', 'idle', true);
	end
	if curBeat == 228 then
		doTweenAlpha('hudFunne', 'camHUD', 0, 0.6, 'linear')
		setProperty('matt.flipX', true);
		setProperty('gf.flipX', true);
		setProperty('eduar.alpha', 1);
		setProperty('john.alpha', 1);
		setProperty('mark.alpha', 1);
	end
	if curBeat % 2 == 0 and curStep > 940 then
		objectPlayAnimation('matt', 'idle', true);
		objectPlayAnimation('tom', 'idle', true);
		objectPlayAnimation('eduar', 'idle', true);
		objectPlayAnimation('john', 'idle', true);
		objectPlayAnimation('mark', 'idle', true);
	end
	if curBeat == 236 then
		doTweenAlpha('hudFunne', 'camHUD', 1, 0.2, 'linear')
	end
	if curBeat == 398 then -- cutscene ending
		doTweenAlpha('hudFunne', 'camHUD', 0, 0.4, 'linear') -- ALEX DIRECTOR WROTE THIS WOOO-
	end
end
--eduardo shit
--script by Shadow Mario, Kevin Kuntz and other dudos
animationsList = {}
holdTimers = {eduar = -1.0};
noteDatas = {eduar = 0};
function makeAnimationList()
	animationsList[0] = 'singLEFT';
	animationsList[1] = 'singDOWN';
	animationsList[2] = 'singUP';
	animationsList[3] = 'singRIGHT';
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Special Sing' then
		if not isSustainNote then
			noteDatas.eduar = direction;
		end
		characterToPlay = 'eduar'
		animToPlay = noteDatas.eduar;
			
		playAnimation(characterToPlay, animToPlay, true);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'doIdol' then
		doIdle = true
	end
end

function playAnimation(character, animId, forced)
	animName = animationsList[animId];
	--debugPrint(animName);
	if character == 'eduar' then
		objectPlayAnimation('eduar', animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
	end
end
--eduardo shit ends

function onTweenCompleted(tag)
	if tag == 'PlaneTweenX' then
		removeLuaSprite('plane', true); -- optimization
	end
	if tag == 'MattTweenX' then
		objectPlayAnimation('matt', 'idle', true)
	end
	if tag == 'tomTweenX' then
		objectPlayAnimation('tom', 'idle', true);
	end
end

function onEvent(name, value1)
	if name == 'well well well' then
		objectPlayAnimation(value1, 'well', true)
	end
end

function onCreatePost()
		makeLuaSprite('eddI', 'eduardo', getProperty('iconP1.x'), getProperty('iconP1.y'))
		setObjectCamera('eddI', 'hud')
		addLuaSprite('eddI', true)
		setObjectOrder('eddI', getObjectOrder('iconP1') + 1)
		setProperty('eddI.flipX', true)
		setProperty('eddI.visible', false)
end

function onUpdatePost(elapsed)
		setProperty('eddI.x', getProperty('iconP1.x') + 50)
		setProperty('eddI.angle', getProperty('iconP1.angle'))
		setProperty('eddI.y', getProperty('iconP1.y') - 50)
		setProperty('eddI.scale.x', getProperty('iconP1.scale.x') - 0.3)
		setProperty('eddI.scale.y', getProperty('iconP1.scale.y') - 0.3)
end