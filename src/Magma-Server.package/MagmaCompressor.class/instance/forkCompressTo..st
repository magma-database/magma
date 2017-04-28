compress
forkCompressTo: outputLocation 
	^ process := (MaClientProcess doBlock: [ self compressTo: outputLocation ])
		 priority: Processor userBackgroundPriority ;
		 resume