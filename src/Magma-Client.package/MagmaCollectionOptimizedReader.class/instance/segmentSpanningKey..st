private
segmentSpanningKey: anInteger 
	"My expression is a single clause.  Answer my own segment if it spans anInteger, otherwise nil.  
	If it doesn't span anInteger, but is at the beginning (trunkStart=1) then it is possible the user has inserted an uncomitted before the first committed, in which case we want to merge that.
	Likewise, if the segment is butted up against the end of the persistent collection but the user has added a new object whose key is beyond the persistent end, answer my segment because it is mergeable."
	^ ((segment includesKey: anInteger) 
		or: [ (segment trunkStart = 1 and: [ anInteger < segment lowestKey ]) 
		or: [ anInteger > segment highestKey and: [ segment atEndForOptimized ] ] ]) 
		ifTrue: [ segment ]