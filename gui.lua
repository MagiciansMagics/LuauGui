function
randomstring()
	local length = math.random(20, 30)
	local array = {}

	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end

	return table.concat(array)
end

function
create_gui_item(parent, reset_on_spawn)
	local gui = Instance.new("ScreenGui")
	gui.Parent = parent
	gui.Name = randomstring()
	gui.ResetOnSpawn = reset_on_spawn or false

	return gui
end

function
create_frame_item(parent, bg_color, bgt, pos, size, draggable)
	local frame = Instance.new("Frame")
	frame.Parent = parent
	frame.Name = randomstring()
	frame.BackgroundColor3 = bg_color or Color3.fromRGB(255, 255, 255)
	frame.BackgroundTransparency = bgt or 0
	frame.Position = pos or UDim2.new()
	frame.Size = size or UDim2.new()
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Active = true
    if draggable then
        frame.Draggable = true or false
    end

	local corner = Instance.new("UICorner")
	corner.Parent = frame
    corner.Name = randomstring()

	return frame
end

function
create_button_item(parent, txt, txt_color, bg_color, bgt, pos, size, callback)
	local button = Instance.new("TextButton")
	button.Parent = parent
	button.Name = randomstring()
	button.Text = txt or "No text"
	button.BackgroundColor3 = bg_color or Color3.fromRGB(255, 255, 255)
    button.TextColor3 = txt_color or Color3.fromRGB(255, 255, 255)
	button.BackgroundTransparency = bgt or 0
	button.Position = pos or UDim2.new()
	button.Size = size or UDim2.new()

	local corner = Instance.new("UICorner")
	corner.Parent = button
    corner.Name = randomstring()

	if type(callback) == "function" then
		button.MouseButton1Click:Connect(callback)
	end

	return button
end

return {
    create_gui_item = create_gui_item,
    create_frame_item = create_frame_item,
    create_button_item = create_button_item
}
