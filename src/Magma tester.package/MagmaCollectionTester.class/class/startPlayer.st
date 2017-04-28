as yet unclassified
startPlayer
	(self isServerImage or: [ self isServer2Image ]) ifTrue: [ MagmaCollectionIndex maRecursiveRemove ].
	super startPlayer