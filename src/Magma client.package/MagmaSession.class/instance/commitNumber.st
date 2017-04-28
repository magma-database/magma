accessing
commitNumber
	"The commitNumber position this session is refreshed to."
	^ guard critical: [ transaction commitNumber ]