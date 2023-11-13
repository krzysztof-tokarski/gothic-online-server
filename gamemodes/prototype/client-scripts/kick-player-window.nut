local window = GUI.Window({
	sizePx = {width = 360, height = 250}
	file = "MENU_INGAME.TGA"
})

function onInit()
{
	local windowSizePx = window.getSizePx()
	local resolution = getResolution()
	window.setPositionPx((resolution.x - windowSizePx.width) / 2, (resolution.y - windowSizePx.height) / 2)
	window.setVisible(true)
	setCursorVisible(true)
}

addEventHandler("onInit", onInit)

// region CloseWindow
addEventHandler("onKey", function(key)
{
	if(key != KEY_P) return

	local isVisible = !window.getVisible();
	setCursorVisible(isVisible)
	window.setVisible(isVisible)

});

local closeButton = GUI.Button({
	relativePositionPx = {x = 300, y = 10}
	sizePx = {width = 50, height = 25}
	file = "INV_SLOT_FOCUS.TGA"
	draw = {text = "X"}
	collection = window
})

closeButton.bind(EventType.Click, function(self)
{
	window.setVisible(false)
	setCursorVisible(true)
})
// endregion CloseWindow

// region KickForm
local idInput = GUI.Input({
	relativePositionPx = {x = 20, y = 50}
	sizePx = {width = 300, height = 50}
	file = "DLG_CONVERSATION.TGA"
	font = "FONT_OLD_20_WHITE_HI.TGA"
	type = Input.Text,
	align = Align.Left
	placeholderText = "Player ID"
	paddingPx = 6
	collection = window
})

local reasonInput = GUI.Input({
	relativePositionPx = {x = 20, y = 100}
	sizePx = {width = 300, height = 50}
	file = "DLG_CONVERSATION.TGA"
	font = "FONT_OLD_20_WHITE_HI.TGA"
	type = Input.Text,
	align = Align.Left
	placeholderText = "Kick reason"
	paddingPx = 6
	collection = window
})

local confirmButton = GUI.Button({
	relativePositionPx = {x = 100, y = 200}
	sizePx = {width = 140, height = 25}
	file = "INV_SLOT_FOCUS.TGA"
	draw = {text = "KICK PLAYER"}
	collection = window
})

confirmButton.bind(EventType.Click, function(self) {
	kickPlayer()
})

function kickPlayer() {
	local id = idInput.getText()
	local reason = reasonInput.getText()

	local packet = Packet()

	packet.writeUInt8(PacketId.KICK_PLAYER)

	packet.writeString(id)
	packet.writeString(reason)

	packet.send(RELIABLE)
}
// endregion KickForm

// region Misc
local header = GUI.Draw({
	relativePositionPx = {x = 100, y = 10}
	text = "Kick player"
	font = "FONT_OLD_20_WHITE_HI.TGA"
	collection = window
})

addEventHandler("GUI.onMouseIn", function(self)
{
	if (!(self instanceof GUI.Button))
		return

	self.setColor(255, 0, 0)
})

addEventHandler("GUI.onMouseOut", function(self)
{
	if (!(self instanceof GUI.Button))
		return

	self.setColor(255, 255, 255)
})
// endregion Misc

