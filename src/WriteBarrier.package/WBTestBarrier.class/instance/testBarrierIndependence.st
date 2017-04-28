as yet unclassified
testBarrierIndependence
	"Independence is accomplished by each WriteBarrier compiling its own instances of the subclasses (which have the same names!)."
	| barrier1 barrier2 arr1 arr2 |
	barrier1 := DirtySetWriteBarrier new.
	barrier2 := DirtySetWriteBarrier new.
	barrier1 add: (arr1 := WbArray with: 'init').
	arr1
		at: 1
		put: 'barrier1'.
	barrier2 add: (arr2 := WbArray with: 'init2').
	arr2
		at: 1
		put: 'barrier2'.
	self
		 assert: arr1 writeBarrier == barrier1 ;
		 assert: arr2 writeBarrier == barrier2 ;
		 assert: barrier1 dirtySet size = 1 ;
		 assert: barrier2 dirtySet size = 1 ;
		 assert: (barrier1 builderForClass: WbArray) barrierClass ~~ (barrier2 builderForClass: WbArray) barrierClass.
	barrier1 unregister.
	barrier2 unregister