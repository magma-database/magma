testing
isValid
	^ {  packageName. author. extension. versionNumber  } allSatisfy: [ : e | e notNil ]