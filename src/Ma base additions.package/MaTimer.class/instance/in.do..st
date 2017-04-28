access
in: aDuration do: aBlock 
	process := 
	[ monitor := Mutex new.
	expired := false.
	delay := (Delay forDuration: aDuration) wait.
	name ifNil: [ name := 'MaTimer for ' , aDuration printString ].
	monitor critical: 
		[ expired := true.
		aBlock value ] ] newProcess.
	process
		name: self name ;
		priority: Processor userInterruptPriority-1.
	process resume