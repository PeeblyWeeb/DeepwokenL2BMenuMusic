game.Loaded:Wait()

if (game.PlaceId) == 4111023553 or game.PlaceId == 6032399813
then
    local already_exists = isfile("layer2bell.mp3")
    if (already_exists == false)
    then
        print("downloading")
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
else
    print("Not in deepwoken!")
end
