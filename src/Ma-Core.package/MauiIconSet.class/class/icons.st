private
icons
	| inst |
	inst := self new.
	^ self iconSelectors collect:
		[ : each | inst perform: each ]