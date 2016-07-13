# Require module
module = require "OrientationEvents"

# Setup OrientationEvents
module.OrientationEvents()

# Sets smoothing for all smooth[Variable]
module.smoothOrientation = .35

wallpaper = new BackgroundLayer image: "images/wallpaper.jpg"


Utils.interval .1, ->

	if module.orientation? # To make sure we're actually receiving orientation-values

		gamma = module.orientation.gamma

		wallpaper.animate
			properties:
				x: Utils.modulate(gamma, [-10, 10], [-wallpaper.width/2, wallpaper.width/2], true)
			curve: "spring(450, 110, 0)"
