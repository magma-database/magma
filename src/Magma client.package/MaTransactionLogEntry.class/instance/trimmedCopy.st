recovery
trimmedCopy
	"Make a copy without things needed merely to applyToCache: so that serialization to the commitPackages recovery file will be quicker."

	^ self copy postTrimmedCopy