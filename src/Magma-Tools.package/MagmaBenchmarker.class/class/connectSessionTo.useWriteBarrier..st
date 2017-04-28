instance creation
connectSessionTo: hostString useWriteBarrier: useWriteBarrier 
	| session |
	session := MagmaSession 
		host: hostString
		port: self port.
	session allowWriteBarrier: useWriteBarrier.
	session connectAs: 'benchTest'.
	^ self session: session