recovery
flushCacheSoon
	"Flushing is horribly expensive, but essential to ensure we can survive a power-outage without corruption.  To balance these opposing forces, we apply and flush only at certain interval, only in the background, only the files that needed flushed, and each file only flushed once."
	applyProcess ifNil: 
		[ applyProcess := 
		[ | startTime |
		startTime := Time millisecondClockValue.
		
		[ (Time millisecondsSince: startTime) > (repositoryController cacheFlushFrequency * 1000) or: [ wantsToClose ] ] whileFalse: [ (Delay forSeconds: 1) wait ].
		self flushCritical: 
			[ self commitCritical: 
				[ self flushCache.
				applyProcess := nil ] ] ] forkAt: (Processor userInterruptPriority max: Processor activeProcess priority+1).
		applyProcess name: 'flush Magma cache' ]