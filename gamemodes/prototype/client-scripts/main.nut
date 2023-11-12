function onInit()
{
	enableEvent_Render(true)

	Chat.print(0, 255, 0, "Welcome on " + getHostname() + "!")
}

addEventHandler("onInit", onInit)

function onCommand(cmd, params)
{
	switch (cmd)
	{
	case "show":
		setCursorVisible(true)
		break

	case "hide":
		setCursorVisible(false)
		break

	case "q":
		exitGame()
		break
		
	case "pos":
		local vec = getPlayerPosition(heroId)
		local angle = getPlayerAngle(heroId)
		
		print("x: " + vec.x + " y: " + vec.y + " z: " + vec.z + " angle: " + angle)
		break
	}
}

addEventHandler("onCommand", onCommand)