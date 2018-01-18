summarize
+ aMaStat 
	| answer myEndTime otherEndTime |
	answer := super + aMaStat.
	answer
		name: self name ;
		startTime: (self startTime min: aMaStat startTime).
	myEndTime := self endTime ifNil: [ DateAndTime now ].
	otherEndTime := aMaStat endTime ifNil: [ DateAndTime now ].
	answer endTime: (myEndTime max: otherEndTime).
	^ answer