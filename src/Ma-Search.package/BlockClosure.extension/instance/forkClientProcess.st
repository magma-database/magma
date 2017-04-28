*ma-search
forkClientProcess
	self argumentCount =1 ifFalse: [ MaUserError signal: thisContext selector, ' must be sent to a one-argument block.'].
	^ (MaClientProcess doBlock: self) resume