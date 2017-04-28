initializing
installWriteBarrierUsing: aMagmaSession
	"Remove and re-add all objects to move them from the readSet into a WriteBarrier."
	| changedObjects |
	WeakArray addWeakDependent: builders.
	changedObjects := self changedObjects.
	self writeBarrierStatusChangedFor: aMagmaSession.
	changedObjects objects do: [ : each | self modified: each ]