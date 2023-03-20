-- thank you skidnik for telling me about getsynasset()

-- depths: 5735553160
-- mainmenu: 4111023553
-- etrean lum: 6032399813
-- dungeon: 8668476218
-- chime: 6832944305
-- east lum: 6473861193

local DeepwokenPlaceIds = {4111023553,6032399813,6473861193,5735553160,8668476218,6832944305}



game.Loaded:Wait()

local plr = game.Players.LocalPlayer

function download(url) 
    local Data = syn.request({
        Url = url,
        Method = "GET"
    }).Body
    return Data
end

if table.find(DeepwokenPlaceIds,game.PlaceId) then
    if isfolder("dwl2bas") == false then
        makefolder("dwl2bas")
    end
    if isfile("dwl2bas/MenuMusic.mp3") == false then
        file = download("https://github.com/PeeblyWeeb/DeepwokenL2BMenuMusic/blob/main/audio/MenuMusic.mp3")
        writefile("dwl2bas/MenuMusic.mp3", file)
    end

    local MenuContours = plr.PlayerGui.LoadingGui.LoadingGui.Music:GetChildren()
    local NewMenuMusic = getsynasset("dwl2bas/MenuMusic.mp3")
    for i,Contour in pairs(MenuContours) do
        Contour.SoundId = NewMenuMusic
    end
end
