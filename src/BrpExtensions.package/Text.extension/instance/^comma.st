*BrpExtensions
, otherCollection 
	"Overidden because Texts should not support object concatenation."
	^ self copyReplaceFrom: self size + 1
		  to: self size
		  with: otherCollection