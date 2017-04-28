create
newTraverseNoBytesNoGlobals
	"Make a new traversal strategy that does not traverse into individual bytes or words of those class-types, only named and index pointers."
	^ self new traverseWhen:
		[ : path : parent : index | | obj |
		obj := path last.
		(self shouldTraverseNoBytes: obj) and: [ self shouldTraverseNoGlobals: obj ] ]