private
sessionsForOtherLocationsDo: oneArgBlock 
	"For the other locations in the Node other than thisLocation, value oneArgBlock."
	self node locationsDo: 
		[ : each | 
		each = self thisLocation ifFalse: [ oneArgBlock value: (self node sessionFor: each) ] ]