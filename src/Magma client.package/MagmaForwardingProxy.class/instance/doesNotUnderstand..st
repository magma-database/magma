private
doesNotUnderstand: aMessage

	^ self
		forward: aMessage
		to: self realObject