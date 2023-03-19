-- made by peeblyweeb
-- thank you skidnik for telling me about getsynasset()

-- place ids
-- depths: 5735553160
-- mainmenu: 4111023553
-- etrean lum: 6032399813
-- dungeon: 8668476218
-- chime: 6832944305
-- east lum: 6473861193

DeepwokenPlaceIds = {4111023553,6032399813,6473861193,5735553160,8668476218,6832944305}


game.Loaded:Wait()

if table.find(DeepwokenPlaceIds,game.PlaceId) then
    if (isfile("layer2bell.mp3") == false)
    then
        local Response = syn.request({
            Url = "https://github.com/PeeblyWeeb/DeepwokenL2BMenuMusic/blob/main/layer2bell.mp3?raw=true",
            Method = "GET"
        })
        
        writefile("layer2bell.mp3", Response.Body)
    end
    local contours = game.Players.LocalPlayer.PlayerGui.LoadingGui.LoadingGui.Music:GetChildren()
    local layer2bell = getsynasset("layer2bell.mp3")
    
    for i,v in pairs(contours)
    do
        v.SoundId = layer2bell
    end
end
