private
changedTimer
	^ changedTimer ifNil: 
		[ changedTimer := MaTimer new 
			in: 1 second
			do: 
				[ self
					changed ;
					resetChangedTimer ] ]