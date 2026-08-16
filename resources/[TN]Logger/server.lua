url = "https://discord.com/api/webhooks/1084365658936053770/iJAsFsQFgDBYeRLPHss8TGCKVZKV2wV8u-s_yb9wI0R9gTqrtRGTqMGBg7w4G3f0H6aX"
DiscordWebhook = {
    ["makeleader"] = "https://discord.com/api/webhooks/1153656512334528583/5hMz8F538BzYdWOSx64odcYY-R0hzGLpjy7Dp-SDp2e1iONL-dBcqGWFGqLL9xavynNp",
    ["makefamilyleader"] = "https://discord.com/api/webhooks/1153657075247894568/ljZLvA77qrmzmSmmC0fPFEE8vpKI7v6qCMNabw-bSsyiJ6spd0DZsGaT-yvRZBojg-GZ",
    ["sethealth"] = "https://discord.com/api/webhooks/1153658303252017162/V6OVQw-c3xM8YAbWDkNSBkxI4sKPTr6dArVU-jSljH5B6NH-2vk-NTTD-VdsuyRSct9D",
    ["goto"] = "https://discord.com/api/webhooks/1153658475428196372/E3mL-vnpb511R_RukIm6l7hMs1pYlPuE5uQCuFsimn-tJZIGcAgZSWLFKqdPG7shuTUL",
    ["gethere"] = "https://discord.com/api/webhooks/1153658690017185882/1tKadkxbvuCvnBv9Ffw2gKRvjvoam0igInfpqCLdTHTqg5a0oikbbY-prvtQaiFCUOf_",
    ["createevent"] = "https://discord.com/api/webhooks/1153658882363764777/WMlx93cJ42uVngZxsNbrGcmaA-OoLQQYTpCshBW79-3G215A1nVbL8smseqe6HIEL6J7",
    ["acceptevent"] = "https://discord.com/api/webhooks/1153659548960305194/wfjXPcMGaOml9dvFP8NmhtsUJkZx0BgvjcBDrMFRpN2SDoxZZ8JFzID4EQPLHS-O8j03",
    ["respawn"] = "https://discord.com/api/webhooks/1153659674651009144/qLtlO6nxlWWy14-HQqa-FxbmKa1mIpNsMjIK6L__bkWOc9fZnAeJ5rqpxAX-etp0Etbh",
    ["setfp"] = "https://discord.com/api/webhooks/1153659957997207584/hhZOexcGuGOCyh2BzYQz9EcUkG-tG4tF3XaG305YA1eAvp4uaePGL_KdrPwrNTwUVKfm",
    ["adminchat"] = "https://discord.com/api/webhooks/1153660083172016138/1CurHUlPq9hNQh9APrbUNkwKwZC0GzRd9XLeJwRildZPRFjuHSraDkeLGfLF0U301uce",
    ["sendmassegeforall"] = "https://discord.com/api/webhooks/1153660474433490965/bMGKlBVVA2LD8Z7XLyug0P6NcCT_F_o0ZqO1oSnZz-7lM6ctz21i_1sjQCTSeLb6frdL",
    ["notfall"] = "https://discord.com/api/webhooks/1153660612002455683/JiaO-XozwaLiq0RhgDNc7kvtgXg8AXQTwmlD3SasW7x2uw2XAJsaxPP42FsA7-XNqbVd",
    ["adminjoin"] = "https://discord.com/api/webhooks/1153660847474888735/208DFwiDQifatrmmug3Es-EhilvdftmEUTYyGJFVXnoezZaBz1JxXwub94QpJVRY65VM",
}
function SendDiscordLog(Chanel,CMD,player,taraf,tedad)
    if DiscordWebhook[Chanel] then
        url = DiscordWebhook[Chanel]
    else
        url = "https://discord.com/api/webhooks/1084365658936053770/iJAsFsQFgDBYeRLPHss8TGCKVZKV2wV8u-s_yb9wI0R9gTqrtRGTqMGBg7w4G3f0H6aX"
    end
    if isElement(taraf) then
        TheName = getPlayerName(taraf) or false
        TheSerial = getPlayerSerial(taraf) or false
    else
        TheName = "Namalom"
        TheSerial = "Namalom"
    end
    if url then
        sendOptions = {
            queueName = "default",
            connectionAttempts = 3,
            connectTimeout = 5000,


            formFields = {
                content = "⚠️"..tostring(CMD).."⚠️\n          ✨MTAName: "..tostring(getPlayerName(player)).."\n          ✨Serial: "..tostring(getPlayerSerial(player)).."\n          ✨IP: "..tostring(getPlayerIP(player)).."\n          ✨Value: "..tostring(tedad).."\n          ✨Taraf: "..tostring(TheName).."\n          ✨Taraf Serial: "..tostring(TheSerial)
                
                --content = "```css\nHWID\n```"
            },
        }
        fetchRemote (DiscordWebhook[Chanel], sendOptions, function()end)
    else
        outputDebugString("Webhook not provided.");
    end
end
