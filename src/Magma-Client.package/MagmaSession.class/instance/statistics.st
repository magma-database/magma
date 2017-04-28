performance
statistics
	^ statistics ifNil: [ statistics := MagmaSessionStatistics new ]