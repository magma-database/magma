private
doesNotUnderstand: aMessage

	overriders do:
		[ : each |
		(each respondsTo: aMessage selector)
			ifTrue: 
				[ | answer |
				answer := aMessage sentTo: each.
				answer ifNotNil: [ ^ answer ] ] ].
	^ aMessage sentTo: self overridee