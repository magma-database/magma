private
initialize
	super initialize.
	parents := self parentsClass new.
	children := self childrenClass new
		at: nil
			put: self newChildCollection ;
		yourself