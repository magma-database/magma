private
stopScanning
	"If scan already in progress, terminate it."
	scanProcess ifNotNil: [ scanProcess isRunning ifTrue: [ scanProcess stop ] ]