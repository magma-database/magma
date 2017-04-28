as yet unclassified
setUp
	tree := TSTree new.
	self words shuffled do: [:ea | tree at: ea put: ea asUppercase].
	empty := TSTree new.