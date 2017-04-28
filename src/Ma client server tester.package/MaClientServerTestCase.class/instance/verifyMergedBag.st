test UDP ByteArray server
verifyMergedBag
	| shouldBag |
	shouldBag := Bag new.
	{  (500 to: 1000). (750 to: 1250)  } do: 
		[ : eachRange | 
		eachRange first 
			to: eachRange last
			do: 
				[ : n | 
				| words |
				words := n asWords.
				shouldBag add: (words 
						copyFrom: 2
						to: words size - 1) ] ].
	"May we expect at least half of them to get through..?"
	self assert: mergedBag size > (shouldBag size * 0.5) truncated.
	self assert: (shouldBag maIncludesAll: mergedBag)