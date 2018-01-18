creation
createObjectUsing: aMaObjectSerializer
	"Objects with byte-based storage-objects can and do materialize now, rather than pointer-based storage-objects, which aren't actually well-formed until after establishingReferencesFrom:."
	^ (self ensureClassUsing: aMaObjectSerializer)
		maMaterializeFrom: self
		using: aMaObjectSerializer