private
load: aMagmaCollectionReaderSegment upTo: anInteger where: aMaExpression withObjects: aBoolean except: removedOids
	(MaQueryExecutor 
		collectionManager: self
		expression: aMaExpression) 
		load: aMagmaCollectionReaderSegment
		upTo: anInteger
		withObjects: aBoolean
		except: removedOids.
	^ aMagmaCollectionReaderSegment