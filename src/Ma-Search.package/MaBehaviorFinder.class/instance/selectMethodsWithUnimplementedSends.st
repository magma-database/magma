methods
selectMethodsWithUnimplementedSends
	"Answer methods which specify a message-selector not implemented by any object in the image."
	| allSelectors |
	allSelectors := self systemNavigation allImplementedMessages.
	self rejectMethods: [ : each | allSelectors includesAnyOf: each maSentSelectors ]