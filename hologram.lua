local texts = Config.holograms

Citizen.CreateThread(function ()
    while true do
        Wait(0)
        Draw3DTexts(texts)
    end
end)


function Draw3DTexts(texts)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    for _, textInfo in ipairs(texts) do
        local x, y, z, textInput, fontId, scaleX, scaleY, viewDistance = 
            textInfo.x, textInfo.y, textInfo.z, textInfo.textInput, 
            textInfo.fontId or 0, textInfo.scaleX or 0.1, textInfo.scaleY or 0.1, 
            textInfo.viewDistance or 20.0
        local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, true)
        if dist <= viewDistance then
            local scale = (1 / dist) * 20
            local fov = (1 / GetGameplayCamFov()) * 100
            local scale = scale * fov
            SetTextScale(scaleX * scale, scaleY * scale)
            SetTextFont(fontId)
            SetTextProportional(true)
            SetTextColour(250, 250, 250, 255)
            SetTextDropshadow(1, 1, 1, 1, 255)
            SetTextEdge(2, 0, 0, 0, 150)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            SetTextCentre(true)
            AddTextComponentString(textInput)
            SetDrawOrigin(x, y, z + 1.5, 0)
            DrawText(0.0, 0.0)
            ClearDrawOrigin()
        end
    end
end
