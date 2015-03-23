# Require module
module = require "OrientationEvents"

# Setup OrientationEvents
module.OrientationEvents()

# Screen height/width – used later in modulate
screenHeight = Framer.Device.screen.height
screenWidth = Framer.Device.screen.width

wallpaper = new Layer 
	y: 0 
	width: 1150 
	height: 2046
	image: "images/wallpaper.jpg"
	
wallpaper.center()

# Sets smoothing for all smooth[Variable]
module.smoothing = .5

# Just so it constantly print NaN when in Framer Studio (and not running from mobile device)

###
if Utils.isMobile()
	Utils.interval .1, ->
		alpha = module.orientation.alpha
		
		wallpaper.animate
			properties:
				midX: Utils.modulate(alpha, [-10, 10], [175, 575], true)
			curve: "spring(550, 100, 0)"
else
###