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
