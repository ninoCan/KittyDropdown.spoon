--- === KittyDropDown ===
---
--- A Hammerspoon Spoon to manage a dropdown Kitty terminal,
--- inspired by quake terminal and ghostty.

local obj = {}
obj.__index = obj

-- Spoon metadata
obj.name = "KittyDropDown"
obj.version = "0.1"
obj.author = "ninoCan"
obj.license = "MIT"
obj.homepage = "https://github.com/ninoCan/KittyDropdown.spoon"

-- Configuration variables

-- Default hotkey
obj.hotkey = { "ctrl", "space" }
-- Default shell
obj.shellName = "kitty"
-- Default location: the left half of the screen
obj.location = '[50,0,100,100]'
-- Singleton appWatcher
obj.appWatcher = nil

--- KittyDropDown:start()
--- Starts the application watcher and binds the hotkey.
function obj:start()
    self.appWatcher = hs.application.watcher.new(function(appName, eventType, appObject)
        if eventType == hs.application.watcher.launched and appName == self.shellName then
            while not appObject:mainWindow() do end
            appObject:mainWindow():moveToUnit(self.location)
        end
    end)
    self.appWatcher:start()

    hs.hotkey.bind(self.hotkey[1], self.hotkey[2], function() self:toggle() end)

    return self
end

--- KittyDropDown:toggle()
--- Toggles the Kitty terminal.
function obj:toggle()
    local app = hs.application.get(self.shellName)
    if app then
        if not app:mainWindow() then
            if app:selectMenuItem({ "Shell", "New OS Window" }) then
                while not app:mainWindow() do
                    app = hs.application.get(self.shellName)
                end
                app:mainWindow():moveToUnit(self.location)
            end
        elseif app:isFrontmost() then
            app:hide()
        else
            hs.spaces.moveWindowToSpace(app:mainWindow(), hs.spaces.focusedSpace())
            app:activate()
            app:mainWindow():moveToScreen(hs.mouse.getCurrentScreen())
            app:mainWindow():moveToUnit(self.location)
        end
    else
        hs.application.launchOrFocus(self.shellName)
    end
end

return obj

