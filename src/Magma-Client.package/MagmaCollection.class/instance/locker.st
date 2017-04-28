accessing
locker
	"Answer the MagmaClientConnection that has this collection locked or nil if it's not locked."
	^ self isNewCollection ifFalse: [ session lockerOf: self ]