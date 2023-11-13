function kickPlayer(pid, packet) {
    local logFileName = "kick_log.txt"
    local logFile
    try {
        logFile = file(logFileName, "a")
    }
    catch(e) {
        error(e)
    }

    local currentTime = date(time(), 'u')
    local formattedDate = format("%04d-%02d-%02d %02d:%02d:%02d",
        currentTime.year,
        currentTime.month + 1,
        currentTime.day,
        currentTime.hour,
        currentTime.min,
        currentTime.sec
    )

    logFile.write(formattedDate + "\n")
    logFile.write("PacketId.KICK_PLAYER operation:" + "\n")

    local id
    local reason
    try {
      id = packet.readString()
      reason = packet.readString()
    } catch(e) {
      logFile.write("Error: " + e + "\n")
      error(e)
    }

    logFile.write("Player ID: " + id + "\n")
    logFile.write("Reason: " + reason + "\n")

    try {
        local typeCastedId
        try {
          typeCastedId = id.tointeger();
        } catch(e) {
          throw "Invalid type for 'id'. Expected integer."
        }

        if (type(reason) != "string") {
          throw "Invalid type for 'reason'. Expected string."
        }

        if (!isPlayerConnected(typeCastedId)) {
          throw "Player not connected."
        }

        kick(typeCastedId, reason)

        local successMsg = format("Player %s has been kicked by %s\n", getPlayerName(typeCastedId),
        getPlayerName(pid))
        local reasonMsg = format("Reason: %s", reason)
        logFile.write("Kick successful.\n")
        sendMessageToAll(255, 80, 0, successMsg)
        sendMessageToAll(255, 80, 0, reasonMsg)
    }
    catch (e) {
      logFile.write("Error: " + e + "\n")
      error(e)
    }

    logFile.write("\n")
    logFile.close()
}