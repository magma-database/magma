network baseline
startBenchmarkHost
	| console |
	self resetRepository.
	console := MagmaServerConsole new open: self benchName.
	console processOn: self port.
	console inspect