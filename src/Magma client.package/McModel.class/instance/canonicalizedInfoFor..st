private
canonicalizedInfoFor: aMCVersionInfo 
	^ objects
		at: {#info. aMCVersionInfo}
		ifAbsentPut: [ aMCVersionInfo ]