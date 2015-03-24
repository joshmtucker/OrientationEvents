###

Based with values documented in:

deviceorientation -> https://developer.mozilla.org/en-US/docs/Web/Events/deviceorientation
devicemotion - > https://developer.mozilla.org/en-US/docs/Web/Events/devicemotion

###

# –––– VARIABLES

# Orientation values
exports.orientation = null

# Motion Values
exports.motion = null

# Used for smoothing out data values
exports.smoothOrientation = 1
exports.smoothMotion = 1

# Filtered variables for orientation
filteredAlpha = 0
filteredBeta = 0
filteredGamma = 0

# Filtered variables for motion
filteredX = 0
filteredY = 0
filteredZ = 0
filteredGravX = 0
filteredGravY = 0
filteredGravZ = 0

# –––– PUBLIC

exports.OrientationEvents = ->
	events = switch
		when window.DeviceOrientationEvent && !(window.DeviceMotionEvent)
			window.addEventListener "deviceorientation", _orientation

			print "Device motion events are not support on this device."
		when window.DeviceMotionEvent && !(window.DeviceOrientationEvent)
			window.addEventListener "devicemotion", _motion

			print "Device orientation events are not suported on this device"
		when window.DeviceOrientationEvent && window.DeviceMotionEvent
			window.addEventListener "deviceorientation", _orientation
			window.addEventListener "devicemotion", _motion
		else 
			print "Device orientation and motion events are not support on this device."

# –––– PRIVATE

_motion = (event) ->
	filteredX = (event.acceleration.x * exports.smoothMotion) + (filteredX * (1-exports.smoothMotion))
	filteredY = (event.acceleration.y * exports.smoothMotion) + (filteredY * (1-exports.smoothMotion))
	filteredZ = (event.acceleration.z * exports.smoothMotion) + (filteredZ * (1-exports.smoothMotion))

	filteredGravX = (event.accelerationIncludingGravity.x * exports.smoothMotion) + (filteredGravX * (1-exports.smoothMotion))
	filteredGravY = (event.accelerationIncludingGravity.y * exports.smoothMotion) + (filteredGravY * (1-exports.smoothMotion))
	filteredGravZ = (event.accelerationIncludingGravity.z * exports.smoothMotion) + (filteredGravZ * (1-exports.smoothMotion))

	exports.motion = 
		x: filteredX
		y: filteredY
		z: filteredZ
		gravX: filteredGravX
		gravY: filteredGravY
		gravZ: filteredGravZ
		rotationRate: event.rotationRate
		interval: event.interval

	return motion

_orientation = (event) ->
	filteredAlpha = (event.alpha * exports.smoothOrientation) + (filteredAlpha * (1- exports.smoothOrientation))
	filteredBeta = (event.beta * exports.smoothOrientation) + (filteredBeta * (1- exports.smoothOrientation))
	filteredGamma = (event.gamma * exports.smoothOrientation) + (filteredGamma * (1- exports.smoothOrientation))

	exports.orientation = 
		alpha: filteredAlpha
		beta: filteredBeta
		gamma: filteredGamma
		absolute: event.absolute


	return orientation

