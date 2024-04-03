--[[
Brand new UI library used by Reflex V3
Written by Chloe on 4/2/2024

Make sure to give credit if you use this, thanks
]]

local reflexUI = {}

function randomString()
	local length = math.random(10, 20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

reflexUI.UIObjects = {
	screenGui = nil,
	mainFrame = nil,
	reflexV3Label = nil,
	showTabsFrameButton = nil,
	tabsFrame = nil,
	tabFrames = {}
}
reflexUI.Data = {
	tabButtonCount = 0,
	tabFrameCount = 0,
	buttonElementCount = 0,
	lastTabButtonFunnyPositionNumber = 0
}

reflexUI.ButtonTableFunctions = {
	setButtonName = function(button, newName)
		button.Name = newName
	end,
}

reflexUI.ToggleTableFunctions = {
	setToggleName = function(toggle, newName)
		toggle.Name = newName
	end,
	
	-- TODO: Implement a set function
}

reflexUI.ModeButtonTableFunctions = {
	setModeButtonName = function(button, newName)
		button.Name = newName
	end,
}

--[[
Name: CreateUI

Description: Creates the UI itself (do this before doing anything else!)

Arguments (Name - Description - Type):
nil

Return Values (Name - Description - Type):
nil
]]
function reflexUI:CreateUI() 
	local ScreenGui = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local ShowTabButtonsButton = Instance.new("TextButton")
	local TabFrame = Instance.new("Frame")
	local CombatTabButton = Instance.new("TextButton")
	local PlayerTabButton = Instance.new("TextButton")
	
	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Name = randomString()
	
	Main.Name = "Main"
	Main.Parent = ScreenGui
	Main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.204219416, 0, 0.187969923, 0)
	Main.Size = UDim2.new(0, 700, 0, 50)
	Main.ZIndex = 727
	
	TextLabel.Parent = Main
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.384184927, 0, 0.0628070086, 0)
	TextLabel.Size = UDim2.new(0, 141, 0, 43)
	TextLabel.Font = Enum.Font.Unknown
	TextLabel.Text = "Reflex V3"
	TextLabel.TextColor3 = Color3.fromRGB(255, 106, 0)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true
	TextLabel.ZIndex = 727
	
	ShowTabButtonsButton.Name = "ShowTabButton"
	ShowTabButtonsButton.Parent = Main
	ShowTabButtonsButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	ShowTabButtonsButton.BackgroundTransparency = 1.000
	ShowTabButtonsButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ShowTabButtonsButton.BorderSizePixel = 0
	ShowTabButtonsButton.Size = UDim2.new(0, 49, 0, 46)
	ShowTabButtonsButton.Font = Enum.Font.Ubuntu
	ShowTabButtonsButton.Text = " ? " --  ?   ? 
	ShowTabButtonsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	ShowTabButtonsButton.TextScaled = true
	ShowTabButtonsButton.TextSize = 14.000
	ShowTabButtonsButton.TextWrapped = true
	ShowTabButtonsButton.ZIndex = 727
	
	TabFrame.Name = "Tabs"
	TabFrame.Parent = Main
	TabFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	TabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabFrame.BorderSizePixel = 0
	TabFrame.Position = UDim2.new(-0.000248151511, 0, 0.915125728, 0)
	TabFrame.Size = UDim2.new(0, 190, 0, 450)
	TabFrame.ZIndex = 727
	TabFrame.Visible = false
	
	reflexUI.UIObjects = {
		screenGui = ScreenGui,
		mainFrame = Main,
		reflexV3Label = TextLabel,
		showTabsFrameButton = ShowTabButtonsButton,
		tabsFrame = TabFrame
	}
end


--[[
Name: CreateTab

Description: Creates a new tab (Organizes other elements for easier finding)

Arguments (Name - Description - Type):
TabName - Self Explainatory - string

Return Values (Name - Description - Type):
FrameName - Allows you to create elements in this frame - string
]]
function reflexUI:CreateTab(name)
	reflexUI.Data.tabButtonCount = reflexUI.Data.tabButtonCount + 1
	
	if reflexUI.Data.tabButtonCount == 1 then
		local newTabButton = Instance.new("TextButton")
		newTabButton.Name = name .. "_TabButton"
		newTabButton.Parent = reflexUI.UIObjects.tabsFrame
		newTabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		newTabButton.BackgroundTransparency = 1.000
		newTabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		newTabButton.BorderSizePixel = 0
		newTabButton.Position = UDim2.new(0, 0, 0.0088888891, 0)
		newTabButton.Size = UDim2.new(0, 190, 0, 33)
		newTabButton.Font = Enum.Font.Ubuntu
		newTabButton.Text = name
		newTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		newTabButton.TextScaled = true
		newTabButton.TextSize = 14.000
		newTabButton.TextWrapped = true
		newTabButton.ZIndex = 727
		
		reflexUI.Data.lastTabButtonFunnyPositionNumber = 0.0088888891
	else
		local newTabButton = Instance.new("TextButton")
		newTabButton.Name = name .. "_TabButton"
		newTabButton.Parent = reflexUI.UIObjects.tabsFrame
		newTabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		newTabButton.BackgroundTransparency = 1.000
		newTabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		newTabButton.BorderSizePixel = 0
		newTabButton.Position = UDim2.new(0, 0, reflexUI.Data.lastTabButtonFunnyPositionNumber + 0.0733333342, 0)
		newTabButton.Size = UDim2.new(0, 190, 0, 33)
		newTabButton.Font = Enum.Font.Ubuntu
		newTabButton.Text = name
		newTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		newTabButton.TextScaled = true
		newTabButton.TextSize = 14.000
		newTabButton.TextWrapped = true
		newTabButton.ZIndex = 727

		reflexUI.Data.lastTabButtonFunnyPositionNumber = reflexUI.Data.lastTabButtonFunnyPositionNumber + 0.0733333342 -- magic number
	end
	
	local newTabFrame = Instance.new("Frame")
	newTabFrame.Name = name .. "_TabFrame"
	newTabFrame.Parent = reflexUI.UIObjects.mainFrame
	newTabFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	newTabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	newTabFrame.BorderSizePixel = 0
	newTabFrame.Position = UDim2.new(-0.000248151511, 0, 0.915125728, 0)
	newTabFrame.Size = UDim2.new(0, 700, 0, 450)
	newTabFrame.ZIndex = 727
	
	reflexUI.Data["buttonElementCount:" .. name .. "_TabFrame"] = 0
	reflexUI.Data["lastButtonElementFunnyNum:" .. name .. "_TabFrame"] = 0
	
	return newTabFrame.Name
end

local function retrieveFrameFromName(frameName) 
	for i, v in pairs(reflexUI.UIObjects.mainFrame) do
		if v.Name == frameName then
			return v
		end
	end
	return nil
end

--[[
Name: CreateButton

Description: Creates a button in a tab

Arguments (Name - Description - Type):
ButtonName - Self Explainatory - string
FrameName - The frame that you created earlier's name - string
ButtonFunction - Function that is ran upon the button being clicked - function

Return Values (Name - Description - Type):
TextButton - The actual textbutton used in the GUI (used to call ButtonTable functions) - TextButton
ButtonTable - A table with functions to rename the button and other stuff - ButtonTable (see the beginning of this script for structure)
]]
function reflexUI:CreateButton(name, frameName, func)
	reflexUI.Data.buttonElementCount = reflexUI.Data.buttonElementCount + 1

	if reflexUI.Data["buttonElementCount:" .. frameName] == 1 then
		local newButtonElement = Instance.new("TextButton")
		newButtonElement.Name = name .. "_Button"
		newButtonElement.Parent = retrieveFrameFromName(frameName)
		newButtonElement.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		newButtonElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
		newButtonElement.BorderSizePixel = 0
		newButtonElement.Position = UDim2.new(0.271428585, 0, 0, 0)
		newButtonElement.Size = UDim2.new(0, 509, 0, 33)
		newButtonElement.Font = Enum.Font.Ubuntu
		newButtonElement.Text = name
		newButtonElement.TextColor3 = Color3.fromRGB(255, 255, 255)
		newButtonElement.TextScaled = true
		newButtonElement.TextSize = 14.000
		newButtonElement.TextWrapped = true
		newButtonElement.ZIndex = 727
		
		spawn(function()
			newButtonElement.MouseButton1Down:Connect(func)
		end)
		return {
			newButtonElement,
			reflexUI.ButtonTableFunctions
		}
	else
		local newButtonElement = Instance.new("TextButton")
		newButtonElement.Name = name .. "_Button"
		newButtonElement.Parent = retrieveFrameFromName(frameName)
		newButtonElement.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		newButtonElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
		newButtonElement.BorderSizePixel = 0
		newButtonElement.Position = UDim2.new(0.271428585, 0, reflexUI.Data["lastButtonElementFunnyNum:" .. frameName] + 0.0733333305, 0)
		newButtonElement.Size = UDim2.new(0, 509, 0, 33)
		newButtonElement.Font = Enum.Font.Ubuntu
		newButtonElement.Text = name
		newButtonElement.TextColor3 = Color3.fromRGB(255, 255, 255)
		newButtonElement.TextScaled = true
		newButtonElement.TextSize = 14.000
		newButtonElement.TextWrapped = true
		newButtonElement.ZIndex = 727
		
		spawn(function()
			newButtonElement.MouseButton1Down:Connect(func)
		end)
		
		reflexUI.Data["lastButtonElementFunnyNum:" .. frameName] = reflexUI.Data["lastButtonElementFunnyNum:" .. frameName] + 0.0733333305
		return {
			newButtonElement,
			reflexUI.ButtonTableFunctions
		}
	end

end

--[[
Name: CreateToggle

Description: Creates a toggle in a tab (basically a button but it acts like a toggle)

Notes:
ToggleFunction can be used with a toggle button value (for example: function(toggleValue))

Arguments (Name - Description - Type):
ToggleName - Self Explainatory - string
State - The state the toggle is in when created - boolean
FrameName - The frame that you created earlier's name - string
ToggleFunction - Function that is ran upon the toggle being clicked - function

Return Values (Name - Description - Type):
TextButton - The actual textbutton used in the GUI (used to call ToggleTable functions) - TextButton
ToggleTable - A table with functions to rename the toggle, set the value, etc. - ToggleTable (see the beginning of this script for structure)
]]
function reflexUI:CreateToggle(name, state, frameName, func)
	reflexUI.Data.buttonElementCount = reflexUI.Data.buttonElementCount + 1

	if reflexUI.Data["buttonElementCount:" .. frameName] == 1 then
		local newButtonElement = Instance.new("TextButton")
		newButtonElement.Name = name .. "_Toggle"
		newButtonElement.Parent = retrieveFrameFromName(frameName)
		newButtonElement.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		newButtonElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
		newButtonElement.BorderSizePixel = 0
		newButtonElement.Position = UDim2.new(0.271428585, 0, 0, 0)
		newButtonElement.Size = UDim2.new(0, 509, 0, 33)
		newButtonElement.Font = Enum.Font.Ubuntu
		if state then
			newButtonElement.Text = name .. " (Enabled)"
		else
			newButtonElement.Text = name .. " (Disabled)"
		end
		newButtonElement.TextColor3 = Color3.fromRGB(255, 255, 255)
		newButtonElement.TextScaled = true
		newButtonElement.TextSize = 14.000
		newButtonElement.TextWrapped = true
		newButtonElement.ZIndex = 727
		
		local toggleValue = state
		
		spawn(function()
			if state then
				func(true)
			end
			newButtonElement.MouseButton1Down:Connect(function()
				toggleValue = not toggleValue
				
				if toggleValue then
					newButtonElement.Text = name .. " (Enabled)"
				else
					newButtonElement.Text = name .. " (Disabled)"
				end
				func(toggleValue)
			end)
		end)
		return {
			newButtonElement,
			reflexUI.ButtonTableFunctions
		}
	else
		local newButtonElement = Instance.new("TextButton")
		newButtonElement.Name = name .. "_Button"
		newButtonElement.Parent = retrieveFrameFromName(frameName)
		newButtonElement.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		newButtonElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
		newButtonElement.BorderSizePixel = 0
		newButtonElement.Position = UDim2.new(0.271428585, 0, reflexUI.Data["lastButtonElementFunnyNum:" .. frameName] + 0.0733333305, 0)
		newButtonElement.Size = UDim2.new(0, 509, 0, 33)
		newButtonElement.Font = Enum.Font.Ubuntu
		if state then
			newButtonElement.Text = name .. " (Enabled)"
		else
			newButtonElement.Text = name .. " (Disabled)"
		end
		newButtonElement.TextColor3 = Color3.fromRGB(255, 255, 255)
		newButtonElement.TextScaled = true
		newButtonElement.TextSize = 14.000
		newButtonElement.TextWrapped = true
		newButtonElement.ZIndex = 727
		
		local toggleValue = state

		spawn(function()
			if state then
				func(true)
			end
			newButtonElement.MouseButton1Down:Connect(function()
				toggleValue = not toggleValue

				if toggleValue then
					newButtonElement.Text = name .. " (Enabled)"
				else
					newButtonElement.Text = name .. " (Disabled)"
				end
				func(toggleValue)
			end)
		end)

		reflexUI.Data["lastButtonElementFunnyNum:" .. frameName] = reflexUI.Data["lastButtonElementFunnyNum:" .. frameName] + 0.0733333305
		return {
			newButtonElement,
			reflexUI.ButtonTableFunctions
		}
	end

end

local function getCurrentTableIndexUsingValue(stringValue, stringTable)
	for i, v in pairs(stringTable) do
		if v == stringValue then
			return i -- return the index
		end
	end
	return -1 -- returns -1 if it doesnt do what its supposed to do
end

--[[
Name: CreateModeButton

Description: Creates a button that allows you to select a value from a table

Notes:
ModeFunction can be used with a mode value (for example: function(newMode))
Right clicking the button will change the index by 1, while left clicking will change the index by -1

Arguments (Name - Description - Type):
ToggleName - Self Explainatory - string
Value - The state the toggle is in when created (is set when the mode changes) - string
ValueTable - The values that are allowed to be used - table
FrameName - The frame that you created earlier's name - string
ModeFunction - Function that is ran upon the mode being changed - function

Return Values (Name - Description - Type):
TextButton - The actual textbutton used in the GUI (used to call ToggleTable functions) - TextButton
ToggleTable - A table with functions to rename the button, set the value, etc. - ModeButtonTable (see the beginning of this script for structure)
]]
function reflexUI:CreateModeButton(name, state, funnyTable, frameName, func)
	reflexUI.Data.buttonElementCount = reflexUI.Data.buttonElementCount + 1

	if reflexUI.Data["buttonElementCount:" .. frameName] == 1 then
		local newButtonElement = Instance.new("TextButton")
		newButtonElement.Name = name .. "_ModeButton"
		newButtonElement.Parent = retrieveFrameFromName(frameName)
		newButtonElement.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		newButtonElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
		newButtonElement.BorderSizePixel = 0
		newButtonElement.Position = UDim2.new(0.271428585, 0, 0, 0)
		newButtonElement.Size = UDim2.new(0, 509, 0, 33)
		newButtonElement.Font = Enum.Font.Ubuntu
		
			newButtonElement.Text = name .. " - " .. state

		newButtonElement.TextColor3 = Color3.fromRGB(255, 255, 255)
		newButtonElement.TextScaled = true
		newButtonElement.TextSize = 14.000
		newButtonElement.TextWrapped = true
		newButtonElement.ZIndex = 727

		local leValue = state
		local currentIndex = getCurrentTableIndexUsingValue(state)
		
		spawn(function()
			newButtonElement.MouseButton1Down:Connect(function()
				if currentIndex - 1 >= 1 then
					currentIndex = currentIndex - 1
					leValue = funnyTable[currentIndex]

					newButtonElement.Text = name .. " - " .. leValue

					func(leValue)
				end
			end)
			newButtonElement.MouseButton2Down:Connect(function()
				if currentIndex + 1 <= #funnyTable then
				currentIndex = currentIndex + 1
				leValue = funnyTable[currentIndex]

					newButtonElement.Text = name .. " - " .. leValue
					
					func(leValue)
					end
			end)
		end)
		return {
			newButtonElement,
			reflexUI.ButtonTableFunctions
		}
	else
		local newButtonElement = Instance.new("TextButton")
		newButtonElement.Name = name .. "_Button"
		newButtonElement.Parent = retrieveFrameFromName(frameName)
		newButtonElement.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		newButtonElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
		newButtonElement.BorderSizePixel = 0
		newButtonElement.Position = UDim2.new(0.271428585, 0, reflexUI.Data["lastButtonElementFunnyNum:" .. frameName] + 0.0733333305, 0)
		newButtonElement.Size = UDim2.new(0, 509, 0, 33)
		newButtonElement.Font = Enum.Font.Ubuntu
		newButtonElement.Text = name .. " - " .. state
		newButtonElement.TextColor3 = Color3.fromRGB(255, 255, 255)
		newButtonElement.TextScaled = true
		newButtonElement.TextSize = 14.000
		newButtonElement.TextWrapped = true
		newButtonElement.ZIndex = 727

		local leValue = state
		local currentIndex = getCurrentTableIndexUsingValue(state)

		spawn(function()
			newButtonElement.MouseButton1Down:Connect(function()
				if currentIndex - 1 >= 1 then
					currentIndex = currentIndex - 1
					leValue = funnyTable[currentIndex]

					newButtonElement.Text = name .. " - " .. leValue

					func(leValue)
				end
			end)
			newButtonElement.MouseButton2Down:Connect(function()
				if currentIndex + 1 <= #funnyTable then
					currentIndex = currentIndex + 1
					leValue = funnyTable[currentIndex]

					newButtonElement.Text = name .. " - " .. leValue

					func(leValue)
				end
			end)
		end)

		reflexUI.Data["lastButtonElementFunnyNum:" .. frameName] = reflexUI.Data["lastButtonElementFunnyNum:" .. frameName] + 0.0733333305
		return {
			newButtonElement,
			reflexUI.ButtonTableFunctions
		}
	end

end

--[[
Name: CreateKeybindButton

Description: Allows you to set a keybind by pressing the button creating using this function


Arguments (Name - Description - Type):
KeybindButtonName - Self Explainatory - string
Value - The current keybind - string
FrameName - The frame that you created earlier's name - string
KeybindButtonFunction - Function that is ran upon the mode being changed - function

Return Values (Name - Description - Type):
nil
]]
function reflexUI:CreateKeybindButton(name, state, funnyTable, frameName, func)
	reflexUI.Data.buttonElementCount = reflexUI.Data.buttonElementCount + 1

	if reflexUI.Data.buttonElementCount == 1 then
		local newButtonElement = Instance.new("TextButton")
		newButtonElement.Name = name .. "_ModeButton"
		newButtonElement.Parent = retrieveFrameFromName(frameName)
		newButtonElement.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		newButtonElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
		newButtonElement.BorderSizePixel = 0
		newButtonElement.Position = UDim2.new(0.271428585, 0, 0, 0)
		newButtonElement.Size = UDim2.new(0, 509, 0, 33)
		newButtonElement.Font = Enum.Font.Ubuntu

		newButtonElement.Text = name .. " - " .. state

		newButtonElement.TextColor3 = Color3.fromRGB(255, 255, 255)
		newButtonElement.TextScaled = true
		newButtonElement.TextSize = 14.000
		newButtonElement.TextWrapped = true
		newButtonElement.ZIndex = 727

		local leValue = state
		local settingKeycode = false

		spawn(function()
			newButtonElement.MouseButton1Down:Connect(function()
				if not settingKeycode then
					settingKeycode = true
					newButtonElement.Text = name .. " - N/A"
				end
			end)
			game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key) -- i love using really old, depreciated functions (real)
				if settingKeycode then
					settingKeycode = false
					leValue = key
				else
					func()
				end
			end)
		end)
	else
		local newButtonElement = Instance.new("TextButton")
		newButtonElement.Name = name .. "_Button"
		newButtonElement.Parent = retrieveFrameFromName(frameName)
		newButtonElement.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		newButtonElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
		newButtonElement.BorderSizePixel = 0
		newButtonElement.Position = UDim2.new(0.271428585, 0, reflexUI.Data["lastButtonElementFunnyNum:" .. frameName] + 0.0733333305, 0)
		newButtonElement.Size = UDim2.new(0, 509, 0, 33)
		newButtonElement.Font = Enum.Font.Ubuntu
		newButtonElement.Text = name .. " - " .. state
		newButtonElement.TextColor3 = Color3.fromRGB(255, 255, 255)
		newButtonElement.TextScaled = true
		newButtonElement.TextSize = 14.000
		newButtonElement.TextWrapped = true
		newButtonElement.ZIndex = 727

		local leValue = state
		local settingKeycode = false

		spawn(function()
			newButtonElement.MouseButton1Down:Connect(function()
				if not settingKeycode then
					settingKeycode = true
					newButtonElement.Text = name .. " - N/A"
				end
			end)
			game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key) -- i love using really old, depreciated functions (real)
				if settingKeycode then
					settingKeycode = false
					leValue = key
				else
					func()
				end
			end)
		end)
	end

end

--[[
Name: CreateLabel

Description: Creates a button that just shows text


Arguments (Name - Description - Type):
LabelName - Self Explainatory - string
FrameName - The frame that you created earlier's name - string

Return Values (Name - Description - Type):
nil
]]
function reflexUI:CreateKeybindButton(name, frameName)
	reflexUI.Data.buttonElementCount = reflexUI.Data.buttonElementCount + 1

	if reflexUI.Data.buttonElementCount == 1 then
		local newButtonElement = Instance.new("TextButton")
		newButtonElement.Name = name .. "_Label"
		newButtonElement.Parent = retrieveFrameFromName(frameName)
		newButtonElement.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		newButtonElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
		newButtonElement.BorderSizePixel = 0
		newButtonElement.Position = UDim2.new(0.271428585, 0, 0, 0)
		newButtonElement.Size = UDim2.new(0, 509, 0, 33)
		newButtonElement.Font = Enum.Font.Ubuntu

		newButtonElement.Text = name

		newButtonElement.TextColor3 = Color3.fromRGB(255, 255, 255)
		newButtonElement.TextScaled = true
		newButtonElement.TextSize = 14.000
		newButtonElement.TextWrapped = true
		newButtonElement.ZIndex = 727
	else
		local newButtonElement = Instance.new("TextButton")
		newButtonElement.Name = name .. "_Label"
		newButtonElement.Parent = retrieveFrameFromName(frameName)
		newButtonElement.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		newButtonElement.BorderColor3 = Color3.fromRGB(0, 0, 0)
		newButtonElement.BorderSizePixel = 0
		newButtonElement.Position = UDim2.new(0.271428585, 0, reflexUI.Data["lastButtonElementFunnyNum:" .. frameName] + 0.0733333305, 0)
		newButtonElement.Size = UDim2.new(0, 509, 0, 33)
		newButtonElement.Font = Enum.Font.Ubuntu
		newButtonElement.Text = name
		newButtonElement.TextColor3 = Color3.fromRGB(255, 255, 255)
		newButtonElement.TextScaled = true
		newButtonElement.TextSize = 14.000
		newButtonElement.TextWrapped = true
		newButtonElement.ZIndex = 727
	end

end

return reflexUI
