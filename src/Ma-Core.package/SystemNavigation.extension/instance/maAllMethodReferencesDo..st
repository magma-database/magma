*ma-core
maAllMethodReferencesDo: aBlock
	"Value aBlock for every method in the system."
	Cursor execute showWhile:
		[ self
			allBehaviorsDo:
				[ : class |
				class selectorsDo:
					[ : sel | 
					aBlock value: (MethodReference class: class selector: sel) ] ] ]