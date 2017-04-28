private
removeListener
	| didTry |
	didTry := false.
	[ collection removeDependent: self ] 
		on: Error
		do: 
			[ : err | 
			"Bug in Squeak; sometimes it gets a 'Subscript out of bounds' when trying to remove from its own DependentsArray!"
			didTry ifFalse: 
				[ (Delay forSeconds: 1) wait.
				didTry := true.
				err retry ] ]