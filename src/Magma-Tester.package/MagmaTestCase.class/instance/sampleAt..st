private-samples
sampleAt: indexInteger 
	^ samplesInMc detect: [ : e | e = (samples at: indexInteger) ]