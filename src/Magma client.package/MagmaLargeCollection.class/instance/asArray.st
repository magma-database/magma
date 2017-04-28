converting
asArray

	| all |
	all := OrderedCollection new: self size.
	self do: [ :each | all add: each ].
	^ all asArray
