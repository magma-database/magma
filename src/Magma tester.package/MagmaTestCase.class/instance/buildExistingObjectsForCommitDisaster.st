test rollback recovery
buildExistingObjectsForCommitDisaster

	clientSession commit:
		[ clientSession root
			at: 'existing-objects for commitDisaster'
			put:
				((500 to: 600) collect: [ : e | e printString -> Object new ]).
		clientSession root
			at: 'object to grow for commitDisaster'
			put: ((OrderedCollection new: 2) add: 1; add: 2; yourself) ]