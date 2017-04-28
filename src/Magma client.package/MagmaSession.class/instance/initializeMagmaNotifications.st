initialize-release
initializeMagmaNotifications
self maMarked: 'delete'.
	self
		when: #materializedFromMagma
		send: #noteMaterialized:
		to: self