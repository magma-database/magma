network baseline
port
	"The port the benchmark host will listen on."
	^ Port ifNil: [ Port := 51969 ]