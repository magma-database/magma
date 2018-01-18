images
isConductorImage
	| entry |
	entry := self conductorImageEntry.
	^ entry notNil and: [ Smalltalk imageEntry = entry ]