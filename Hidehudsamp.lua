script_author('Carrentine')
script_version_number(1.0)

local vkeys = require 'vkeys'
local displayState = true
local radarState = 0
local render = false

function main()
    if not isSampAvailable() or not isSampfuncsLoaded() then return false end
    sampAddChatMessage('displayStateChanger by Carrentine loaded.', 0xFF239E13)

    -- Скрытие HUD при заходе в игру
    displayState = false
    if displayState then radarState = 0 else radarState = 2 end
    displayHud(displayState)
    writeMemory(12216172, 1, radarState, true)

    while true do
        wait(0)
    end
end

function Render()
    while true do
        wait(0)
        if render then
            local font = renderCreateFont('Consolas', 10, 12)
            local x, y = getScreenResolution()
            y = y - 21
            renderFontDrawText(font, 'displayState: '..tostring(displayState), 7, y, 0xFFFFFFFF, false)
        end
    end
end
lua_thread.create(Render)
