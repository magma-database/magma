private
newSkeletonFor: aMaObjectBuffer fromProxy: aMaMutatingProxy
	| skel |
	skel := aMaObjectBuffer createObjectUsing: self.
	aMaMutatingProxy ifNotNil: [ aMaMutatingProxy setRealObjectTo: skel ].
	self
		oidOf: skel
		is: aMaObjectBuffer oid.
	^ skel