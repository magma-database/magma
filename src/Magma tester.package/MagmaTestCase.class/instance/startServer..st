initialize-release
startServer: handleForwardRecovery 
	magmaConsole := MagmaServerConsole new.
	[ magmaConsole
		 open: self environmentPath ;
		 yourself ]
		maOn: MagmaPotentiallyOpenError
		do:
			[ : err | potentiallyOpenSignaled := true.
			err resume ]
		on: MagmaForwardRecoveryNeeded
		do:
			[ : warning | forwardRecoverySignaled := true.
			warning resume: handleForwardRecovery ].
	magmaConsole processOn: self class defaultServerPort.
	magmaConsole statistics snapshotInterval:
		(1
			to: 60 * 24
			by: 1)