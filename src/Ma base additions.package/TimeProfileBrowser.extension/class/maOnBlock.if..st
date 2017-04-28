*ma base additions
maOnBlock: block if: conditionBlock
	"Allows you to build up your sample set before invoking the profiler."
	^conditionBlock value 
		ifTrue: [ self onBlock: block ]
		ifFalse: [ block value ]