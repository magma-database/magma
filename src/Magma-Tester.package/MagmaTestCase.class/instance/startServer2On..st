initialize-release
startServer2On: aFileDirectory
	magmaConsole := MagmaServerConsole new
		open: aFileDirectory fullName ;
		processOn: self class defaultServer2Port ;
		yourself.
	magmaConsole statistics snapshotInterval: (1 
			to: 60*24
			by: 1)