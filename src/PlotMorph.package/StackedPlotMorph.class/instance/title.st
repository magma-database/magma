accessing
title
	^ title ifNil:
		[ plots isEmpty ifFalse: [ plots first title ] ]