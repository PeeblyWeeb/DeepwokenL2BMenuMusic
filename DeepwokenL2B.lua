-- thank you skidnik for telling me about getsynasset()

-- depths: 5735553160
-- mainmenu: 4111023553
-- etrean lum: 6032399813
-- dungeon: 8668476218
-- chime: 6832944305
-- east lum: 6473861193

local DeepwokenPlaceIds = {4111023553,6032399813,6473861193,5735553160,8668476218,6832944305}
local RequiredAudios = {"MenuMusic.mp3", "ObtainingBell.mp3"}


-- game.Loaded:Wait()

function download(url) 
    local file = syn.request({
        Url = url,
        Method = "GET"
    }).Body
    return file
end

if table.find(DeepwokenPlaceIds,game.PlaceId) then
    if isfolder("dwl2bas") == false then
        makefolder("dwl2bas")
    end
    for i,Audio in pairs(RequiredAudios) do
        if isfile(string.format("dwl2bas/%s", Audio)) == false then
            file = download(string.format("https://github.com/PeeblyWeeb/DeepwokenL2BMenuMusic/blob/main/audio/%s", Audio))
            writefile(string.format("dwl2bas/%s", Audio), file)
        end
    end

    local MenuContours = game.Players.LocalPlayer.PlayerGui.LoadingGui.LoadingGui.Music:GetChildren()
    local NewMenuMusic = getsynasset("dwl2bas/MenuMusic.mp3")
    local NewObtainBell = getsynasset("dwl2bas/ObtainBell.mp3")

    for i,Contour in pairs(MenuContours) do
        Contour.SoundId = NewMenuMusic
    end
    game:WaitForChild("ReplicatedStorage")
    game.ReplicatedStorage.Assets:WaitForChild("Effects")
    game:GetService("ReplicatedStorage").Assets.Effects.ResonanceActivate.Sound = NewObtainBell
end