*brpExtensions
at: key ifAbsent: absentBlock ifPresent: presentBlock 
	"Answer the result of evaluating presentBlock with the value associated with the key or, 
	if key isn't found, answer the result of evaluating absentBlock."

	^ self at: key ifPresent: presentBlock ifAbsent: absentBlock 