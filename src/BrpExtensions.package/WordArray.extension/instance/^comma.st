*brpextensions
, otherCollection 
	"Overidden to preserve standard concatentation for WordArray's."
	^ self copyReplaceFrom: self size + 1
		  to: self size
		  with: otherCollection