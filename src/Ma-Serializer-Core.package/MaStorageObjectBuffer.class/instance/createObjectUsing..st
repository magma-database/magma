accessing
createObjectUsing: aMaObjectSerializer

	^ (self ensureClassUsing: aMaObjectSerializer)
		maMaterializeFromGraph: self asByteArray
		using: aMaObjectSerializer copyWithNewOidSpace