accessing
do: aBlock until: untilBlock 
	[ curr isNil or: [ (untilBlock value: curr) ] ] whileFalse:
		[ aBlock value: curr.
		self advance ]