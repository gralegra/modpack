function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Pixel Char Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'fuegopixelnotes'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.2'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Pixel Char Note' then
		triggerEvent('Orange Flash', '0.6')
		playSound('Flame')
		triggerEvent('Screen Shake', '0.1, 0.1', '0.1, 0.1')
	end
end

function onEvent(n,v1,v2)
    if n == 'Orange Flash' then
        makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'FFA500')
        addLuaSprite('flash', true);
        setLuaSpriteScrollFactor('flash',0,0)
        setProperty('flash.scale.x',2)
        setProperty('flash.scale.y',2)
        setProperty('flash.alpha',0)
        setProperty('flash.alpha',1)
        doTweenAlpha('flTw','flash',0,v1,'linear')
    end
end