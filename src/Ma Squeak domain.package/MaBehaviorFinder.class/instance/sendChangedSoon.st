private
sendChangedSoon
	"Sending #changed on every #addMethod really slows things down.  Only send changed if there has been one second of inactivity."
	self changedTimer resetDelay