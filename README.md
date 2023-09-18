guestList = {
"02:15:9a:ee:19:30+E1C1FC39F320EB1E1C7089B63D180D9C",
"02:70:ec:8d:e9:00+219F42E34CE97537AAA1060E48877D97",
"02:f3:c3:15:10:8c+C58B3C0891507C6F29B9DB094065936F",
"02:8a:d3:28:0a:9f+8382CDDB36737D8510E5D9A256AAB955",

}

countBotIP = 2
proxyer =  {
    "45.150.175.104:26025:Io8PrzE3Y:52M9FGQNW",
    "45.150.175.105:41826:Io8PrzE3Y:52M9FGQNW",

}
useSocks = false
function getSocks(v)
    local hostname, port, username, password = v:match("([^:]+):([^:]+):([^:]+):([^:]+)")
    Proxy = {
        HostName= hostname..":"..port,
        Username= username,
        Password= password,
        Type=SOCKS5--SOCKS5/BOTNET
    }
    return Proxy
end
stackSocks = 1
stackBatas = countBotIP
countBatas = 0
for index,user in pairs(guestList) do
    for socks = 1, 1 do
        if useSocks then
        loginGuest("",getSocks(proxyer[stackSocks]),user)
        sleep(10000)
        else
        loginGuest("",user)
		setBool("autoReconnect", true)
        end
    end
    bot = getAllBot()[index]
    if countBatas >= stackBatas then
        stackSocks = stackSocks + 1
        countBatas = 0
    end
    log(bot:getLocal().name.." login with proxy "..proxyer[stackSocks])
    countBatas = countBatas + 1
end

for i, bot in pairs(getAllBot()) do
bot:setBool("autoReconnect",true)
end
