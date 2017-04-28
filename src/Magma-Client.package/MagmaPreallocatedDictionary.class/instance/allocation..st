initialize-release
allocation: numberOfSlots 
	numberOfSlots copy == numberOfSlots copy ifFalse: [ MagmaUserError signal: 'Max pre-allocation allowed is ' , SmallInteger maxVal asString ].
	maxBuckets := numberOfSlots.
	array := MagmaArray new
		
"		at: numberOfSlots
		put: nil ;
"		 pageSize: 1 ;
		 yourself