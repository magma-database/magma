test blocks
addExternalRefsBlock
	| blocks |
	blocks := {self selfRefBlock. 
	self instVarRefBlock}.
	self assert: blocks first value = blocks second value.
	clientSession commit:
		[ clientSession root
			at: #testExternalRefsBlock
			put: blocks ]