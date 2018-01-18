drawing
selectionVertices
	| vertices |
	vertices := OrderedCollection new.
	self selectedPoints do:
		[ : each | vertices add: self topLeft + (self scale: each x @ each maxY) ].
	self selectedPoints reverseDo:
		[ : each | vertices add: self topLeft + (self scale: each x @ each minY) ].
	vertices size > 1 ifTrue: [ vertices add: vertices first ].
	^ vertices