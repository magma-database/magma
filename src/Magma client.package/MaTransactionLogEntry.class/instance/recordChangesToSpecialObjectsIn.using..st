actions
recordChangesToSpecialObjectsIn: aMaCommitLogEntry using: aMaTransactionLog

	aMaTransactionLog specialOidsDo:
		[ : eachOid : eachKey |
		(aMaCommitLogEntry hasCommitted: eachOid)
			ifTrue:
				[ aMaCommitLogEntry noteDidCommitSpecialOid.
				self
					ensureWillCall: eachKey
					at: eachOid ] ]