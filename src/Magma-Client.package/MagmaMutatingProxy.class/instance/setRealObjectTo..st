accessing
setRealObjectTo: anObject
	realObject := anObject.
	session addProxy: self