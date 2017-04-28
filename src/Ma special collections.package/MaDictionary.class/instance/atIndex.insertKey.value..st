private
atIndex: index insertKey: key value: value
	| newb |
	newb := self associationClass key: key value: value next: (array at: index).
	array at: index put: newb.
	tally := tally + 1.
	self checkForOverflow.
	^ value

	