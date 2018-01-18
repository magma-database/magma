private
guard
	^ guard ifNil: [ guard := Mutex new ]