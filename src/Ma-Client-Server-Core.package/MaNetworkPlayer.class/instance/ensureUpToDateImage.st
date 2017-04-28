private
ensureUpToDateImage
	| imageEntry |
	imageEntry := self imageEntry.
	(imageEntry isNil or: [ orchestra imageTimestamp > imageEntry modificationTime ]) ifTrue: [ self createImage ]