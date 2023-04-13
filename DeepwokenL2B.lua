local rs = game:GetService("RunService")

-- thank you skidnik for telling me about getsynasset()

-- depths: 5735553160
-- mainmenu: 4111023553
-- etrean lum: 6032399813
-- dungeon: 8668476218
-- chime: 6832944305
-- east lum: 6473861193

local DeepwokenPlaceIds = {4111023553,6032399813,6473861193,5735553160,8668476218,6832944305}
local RequiredAudios = {"MenuMusic.mp3","Ferryman.mp3"}


game.Loaded:Wait()


function download(url, name) 
    local file = syn.request({
        Url = url,
        Method = "GET"
    })
    writefile(string.format("dwl2bas/%s", name), file.Body)
end

if table.find(DeepwokenPlaceIds,game.PlaceId) then
    if isfolder("dwl2bas") == false then
        makefolder("dwl2bas")
    end
    for i,Audio in pairs(RequiredAudios) do
        if isfile(string.format("dwl2bas/%s", Audio)) == false then
            download(string.format("https://github.com/PeeblyWeeb/DeepwokenL2BMenuMusic/blob/main/audio/%s?raw=true", Audio), Audio)
        end
    end

    local MenuContours = game.Players.LocalPlayer.PlayerGui.LoadingGui.LoadingGui.Music:GetChildren()
    local NewMenuMusic = getsynasset("dwl2bas/MenuMusic.mp3")

    for i,Contour in pairs(MenuContours) do
        Contour.SoundId = NewMenuMusic
    end
    if game.PlaceId == 6473861193 then
        local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
        PlayerGui:WaitForChild("WorldClient")
        local tracks = PlayerGui.WorldClient.Tracks
        local combat = tracks.Combat
        local toreplace = "rbxassetid://5995252439"
        local NewAudio = getsynasset("dwl2bas/Ferryman.mp3")
        rs.Heartbeat:Connect(function ()
            for i,v in pairs(tracks:GetChildren()) do 
                if v.SoundId == toreplace then
                    print("i found the funny uh audio thing i think i uh uh here uh take this yeah!")
                    print(v)
                    v.SoundId = NewAudio
                end
            end
        end)
    end
end

