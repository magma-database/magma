private
doesNotUnderstand: aMessage
	| theReal | theReal := self realObjectIfMutatingProxy realObject.
	aMessage lookupClass: theReal class.
	^ aMessage sendTo: theReal