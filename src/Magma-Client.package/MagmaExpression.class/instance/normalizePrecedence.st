private
normalizePrecedence
	"Collate conditions with like operators."
	self terms do:
		[ : t | t normalize ].
	((self terms select:
		[ : t | t isExpression ]) allSatisfy:
		[ : t | t operator = self operator ]) ifTrue:
		[ | all |
		all := OrderedCollection new.
		self terms do:
			[ : t | t addTermsTo: all ].
		terms := all ].
	terms := self terms asArray