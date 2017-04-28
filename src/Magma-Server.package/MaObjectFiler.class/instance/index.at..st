actions
index: oidInteger at: filePositionInteger

	^filePositionIndex
		at: (MaOidCalculator indexPositionForOid: oidInteger)
		put: filePositionInteger