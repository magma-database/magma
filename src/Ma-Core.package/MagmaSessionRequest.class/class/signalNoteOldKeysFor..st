signaling
signalNoteOldKeysFor: anObject 
	self 
		signal: 'noting old keys'
		do: [ : session | session noteOldKeysFor: anObject ]