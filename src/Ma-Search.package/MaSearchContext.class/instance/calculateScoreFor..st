private comparing
calculateScoreFor: compareString
	"Enumerate my sets of keywords to find the lowest score of the set.  Recall, my keywords are an OrderedCollection of Array's of keywords.  Each Array are OR'd with the other Arrays, so whichever Array has the lowest (best) score represents the score for the entire keywords collection."
	^ keywords
		inject: self noMatchScore
		into:
			[ : min : eachArray |  | setScore |
			setScore :=
				self
					calculateSet: eachArray
					scoreFor: compareString.
			setScore min: min ]