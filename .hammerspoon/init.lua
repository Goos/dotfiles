-- init grid
hs.grid.setGrid'8x8'
hs.grid.setMargins{0, 0}

-- disable animation
hs.window.animationDuration = 0

-- hotkey mash
local mash       = {"cmd", "shift"}
local mash_ctrl  = {"ctrl", "cmd", "shift"}

--------------------------------------------------------------------------------
local function getGridSize()
  local grid = hs.grid.getGrid(hs.window.focusedWindow():screen())
  return grid.w, grid.h
end

local function halfRight(grid)
  local width, height = getGridSize()
  grid.h = height
  grid.w = width / 2
  grid.y = 0
  grid.x = width / 2
end

local function halfLeft(grid)
  local width, height = getGridSize()
  grid.h = height
  grid.w = width / 2
  grid.y = 0
  grid.x = 0
end

local function halfTop(grid)
  local width, height = getGridSize()
  grid.h = height / 2
  grid.w = width
  grid.y = 0
  grid.x = 0
end

local function halfBottom(grid)
  local width, height = getGridSize()
  grid.h = height / 2
  grid.w = width
  grid.y = height / 2
  grid.x = 0
end

local function topLeft(grid)
  local width, height = getGridSize()
  grid.h = height / 2
  grid.w = width / 2
  grid.y = 0
  grid.x = 0
end

local function topRight(grid)
  local width, height = getGridSize()
  grid.h = height / 2
  grid.w = width / 2
  grid.y = 0
  grid.x = width / 2
end

local function bottomLeft(grid)
  local width, height = getGridSize()
  grid.h = height / 2
  grid.w = width / 2
  grid.y = height / 2
  grid.x = 0
end

local function bottomRight(grid)
  local width, height = getGridSize()
  grid.h = height / 2
  grid.w = width / 2
  grid.y = height / 2
  grid.x = width / 2
end

-- snapping windows
hs.hotkey.bind(mash, 'return', hs.grid.maximizeWindow)
hs.hotkey.bind(mash, 'H', function () hs.grid.adjustWindow(halfLeft) end)
hs.hotkey.bind(mash, 'J', function () hs.grid.adjustWindow(halfBottom) end)
hs.hotkey.bind(mash, 'K', function () hs.grid.adjustWindow(halfTop) end)
hs.hotkey.bind(mash, 'L', function () hs.grid.adjustWindow(halfRight) end)
hs.hotkey.bind(mash_ctrl, 'Y', function () hs.grid.adjustWindow(topLeft) end)
hs.hotkey.bind(mash_ctrl, 'P', function () hs.grid.adjustWindow(topRight) end)
hs.hotkey.bind(mash_ctrl, 'B', function () hs.grid.adjustWindow(bottomLeft) end)
hs.hotkey.bind(mash_ctrl, '.', function () hs.grid.adjustWindow(bottomRight) end)

hs.hotkey.bind(mash, "'", function() hs.fnutils.map(hs.window.visibleWindows(), hs.grid.snap) end)

-- -- resize windows
-- hs.hotkey.bind(mash_ctrl, 'U', hs.grid.resizeWindowThinner)
-- hs.hotkey.bind(mash_ctrl, 'I', hs.grid.resizeWindowShorter)
-- hs.hotkey.bind(mash_ctrl, 'O', hs.grid.resizeWindowTaller)
-- hs.hotkey.bind(mash_ctrl, 'P', hs.grid.resizeWindowWider)
-- 
-- -- change focus
-- hs.hotkey.bind(mash_ctrl, 'H', function() hs.window.focusedWindow():focusWindowWest() end)
-- hs.hotkey.bind(mash_ctrl, 'L', function() hs.window.focusedWindow():focusWindowEast() end)
-- hs.hotkey.bind(mash_ctrl, 'K', function() hs.window.focusedWindow():focusWindowNorth() end)
-- hs.hotkey.bind(mash_ctrl, 'J', function() hs.window.focusedWindow():focusWindowSouth() end)


-- snap all newly launched windows
local function auto_tile(appName, event)
	if event == hs.application.watcher.launched then
		local app = hs.appfinder.appFromName(appName)
		-- protect against unexpected restarting windows
		if app == nil then
			return
		end
		hs.fnutils.map(app:allWindows(), hs.grid.snap)
	end
end

-- start app launch watcher
hs.application.watcher.new(auto_tile):start()
