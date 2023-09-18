guestList = {
    "02:97:CA:4B:A3:CD+31431678AC4426C969EB5C8D4FD3EABB",

}
countBotIP = 3
proxyer =  {
    "123.0.0.1:8080:sdfdf:sdfsf",
    "123.0.0.1:8080:sdfdf:sdfsf",
    "123.0.0.1:8080:sdfdf:sdfsf",
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