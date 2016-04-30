Elm.Native.Clock = {};
Elm.Native.Clock.make = function(localRuntime) {
	localRuntime.Native = localRuntime.Native || {};
	localRuntime.Native.Clock = localRuntime.Native.Clock || {};
	if (localRuntime.Native.Clock.values)
	{
		return localRuntime.Native.Clock.values;
	}

	return localRuntime.Native.Clock.values = {
		currentTime: function() {
            return Date.now();
        }
	};
};
