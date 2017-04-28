private
commitLogRecordAt: commitNumber 
	"Calls commitRecordsFrom:"
	| answerArray |
	answerArray := self secondarySubmit:
		(MaCommitLogRecordRequest new
			 startingCommitNumber: commitNumber ;
			 endingCommitNumber: commitNumber yourself).
	^ answerArray
		ifEmpty: [ MagmaUnavailableCommitRecord signal ]
		ifNotEmpty: [ answerArray first ]