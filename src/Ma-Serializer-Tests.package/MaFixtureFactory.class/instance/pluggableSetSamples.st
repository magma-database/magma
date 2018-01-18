future support
pluggableSetSamples

	^ Array
		with: PluggableSet integerSet
		with: (PluggableSet integerSet addAll: (-5 to: 50 by: 2); yourself)