private
commitRecord
	"The MaCommitLogRecord that committed this buffer."
self maMarked: 'performance'.
"This is bad for an old db with no commit-log file history, it'll keep trying over and over... :("
	^ commitRecord ifNil: [ commitRecord := controller commitRecordAt: self commitNumber ]