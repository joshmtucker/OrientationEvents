# OrientationEvents
Handle device orientation events with Framer Studio. **To SEE and USE values, you must run your prototype on a mobile device that supports device orientation events.**

Code was applied from <a href="https://developer.mozilla.org/en-US/docs/Web/Events/deviceorientation">deviceorientation</a> and <a href="https://developer.mozilla.org/en-US/docs/Web/Events/devicemotion">devicemotion</a>. View the <a href="http://www.w3.org/TR/orientation-event/#devicemotion">DeviceOrientationEvents Event Specification</a> for full source.

# Usage

Put the OrientationEvents.coffee file in the /modules folder inside your Framer project. To include in Framer Studio, put the following code at the top of your project:

```coffee
variableName = require "OrientationEvents"
```

### Initiate
Setup event listeners for device orientation and motion.

```coffee
variableName.OrientationEvents()

# This will print out an error if your device does not support orientation and (or) motion events
```

### Values

Values are split up between orientation and motion events and are individual properties. Use them in your code as such:

```coffee
# Orientation variables
variableName.orientation.alpha # Current orientation around Z axis (tilt along perpendicular line to device)
variableName.orientation.beta # Current orientation around X axis (backward/forward tilt)
variableName.orientation.gamma # Current orientation around Y axis (left/right tilt)

variableName.orientation.absolute # True if orientation is provided as difference between device coordinate frame and the Earth's coordinate frame. Else false

# Motion variables
variableName.motion.x # Acceleration along X axis
variableName.motion.y # Acceleration along Y axis
variableName.motion.z # Acceleration along Z axis

variableName.motion.gravX # Acceleration along X axis including gravity
variableName.motion.gravY # Acceleration along Y axis including gravity
variableName.motion.gravZ # Acceleration along Z axis including gravity

variableName.motion.rotationRate # Rate of change on all axes. Expressed in degrees per second
variableName.motion.interval # Interval of time in milliseconds that data is obtained from device
```

## Smoothing
Orientation and motion values are quite jittery in raw form. If you wish to smooth values, I added a means of doing this for both orientation and motion events using a low-pass filter. 

The way the orientation and motion event properties are computed (with the exception of .absolute, .rotationRate, and .interval) is as follows:

> Let's use variable.orientation.alpha (for example)

> filteredAlpha = (event.alpha * exports.smoothOrientation) + (filteredAlpha * (1-exports.smoothing)

To set smoothing for orientation and motion event values, use the following:

```coffee
# Values set should be between 0 and 1. The higher the value, the less smooth it is. 
# Setting to 0 or 1 outputs raw values
# Setting smoothing values affects all properties for each respective variable (documented above).
# Defaults for both are set to 1

variableName.smoothOrientation = 1
variableName.smoothMotion = .5
```

## Example

Download the DeviceOrientationEvents.framer project to see how to apply values. I used it to build a Facebook Paper-like pan on a photo.

## Questions?

I am available here on GitHub, the <a href="https://www.facebook.com/groups/framerjs/">FramerJS Facebook Group</a>, and <a href="https://www.twitter.com/joshmtucker">Twitter</a>.


