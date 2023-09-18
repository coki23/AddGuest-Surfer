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
        sleep(500)
        else
        loginGuest("",user)
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
