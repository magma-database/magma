utilities
commitRestore: pathOrMagmaLocalLocation 
	| rep |
	rep := self open: pathOrMagmaLocalLocation asMagmaLocalLocation.
	[ rep commitRestore ] ensure: [ rep close ]