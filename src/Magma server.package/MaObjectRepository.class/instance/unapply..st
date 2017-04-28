recovery
unapply: aMaApplyRecord 
	"Reapply the contents of aMaApplyRecord to the file it came from."
	aMaApplyRecord isContentRelated
		ifTrue:
			[ self
				fileManagerFor: aMaApplyRecord
				ifPresent:
					[ : fileManager | fileManager unapplyUsing: aMaApplyRecord ]
				ifAbsent: [ "I don't think we should ever get here now thanks to the new ifFalse: path just recently added.  Before, we could get here if a new file was created (i.e., a new large-collection) but the vm crashed before the writes of the definition occurred; in which case the largeCollectionManager would not be able to be opened."
					"It should only be a MaNewFileRecord in that case, so we don't even need to pass a fileStream of any kind.."
					aMaApplyRecord unapplySelf: nil ] ]
		ifFalse: [ aMaApplyRecord unapplySelf: nil ]