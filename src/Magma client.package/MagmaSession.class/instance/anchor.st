private
anchor
	"Calls readAnchorFor:using: in server."
	^ guard critical: 
		[ anchor ifNil: 
			[ | anch |
			anch := self materializeAnchorFrom: (self secondarySubmit: (MaAnchorRequest new
						readStrategy: self resetReadStrategy ;
						yourself)).
			"avoid the root getting garbage collected before we can capture the changes because the user wrote mySession commit: [ mySession root at: 'hello' put: 'world' ]."
			anchor := self inTransaction ifTrue: 
				[ "otherwise, nil it out"
				anch ].
			anch ] ]