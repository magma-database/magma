accessing
protocol 
	"This is the protocol needed to talk to a magma server  Answer a SortedCollection to ensure the classes are added in the same order, since #allSubclasses will not always answer in the same order between images"
	^ { LargePositiveInteger. MaSerializedGraphBuffer.
		MaByteObjectBuffer . MaVariableWordBuffer . MaVariableObjectBuffer . MaFixedObjectBuffer . MaStorageObjectBuffer . MaVariableBuffer },
	"various requests"
		{MaLargeCollectionSizeRequest . MaTransactionRequest . MaReadRequest . MaCommitRequest . MaCommitLogRecordRequest . MaGetMcLockerRequest . MaWriteRequest . MagmaPathNameRequest . MaAnchorRequest . MaSaveAndExitImageRequest . MaRepositoryConnectionRequest . MaLoadFromReaderRequest . MaRepositoryDisconnectRequest . MagmaFullBackupRequest . MagmaIdRequest . MaLargeCollectionSegmentRequest . MaAbortTransactionRequest . MaReaderTrunkRequest . MaWarmBackupUpdateRequest . MagmaSwapPrimaryDutyRequest . MaLoadProgressRequest . MaSegmentByIndexRequest . MagmaServerStatisticsRequest . MaServerPerformRequest . MaPrimitiveAttributesRequest . MaRefreshRequest . MaDownloadCodeRequest . MaRefreshSegmentRequest . MagmaEnsureCorrectNodeConfiguration . MaReadMultipleRequest . MaAbstractReadRequest . MaKeyIntervalInfoRequest . MagmaRequestSwapPrimaryDutyRequest . MagmaBeWarmBackupRequest . MagmaNoteUnreachableServer. MaRemoveSecondaryLocationRequest. MaRawBufferRequest. MagmaReleaseReaderRequest },
	"extra objects for some requests"
		{ MaCommitPackage.  MaBasicReadStrategy.  MaReadStrategy },
	"various results"
		{ MagmaCollectionSegment . MaRefreshViewResult . MaReadResult . MagmaLargeCollectionSegment . MaCommitResult . MagmaCollectionReaderSegment . MaFailedCommitResult },
	"extra objects for results"
		{ MagmaId. UUID. MagmaNode. MaFailedCommitResult. MagmaClientConnection. MagmaCommitConflict. Fraction. MaServerLocation. MaCommitLogEntry. MaCommitLogRecord }, 
		{MagmaLocalLocation . MagmaRemoteLocation . MagmaLocation},
	"Statistics querys"
		{ Interval. DateAndTime. Duration. MaHistoricalStat. MaStatHistory. MagmaServerStatistics },
	"query expressions"
		{ MaClause . MaExpression . MaQueryTrunkClause. MaQueryTrunk },
	"MagmaCollections"
		{MagmaSet . MagmaCollection. IdentityDictionary.  MaIdentityDictionary.  MagmaIndexDescription },
	"large-collection changes"
		{ MagmaCollectionChanges . MagmaArrayChanges . MagmaSetChanges },
	"parts of MagmaCollectionChanges"
		{ Association.  MaChangedKeySpecification },
	"exceptions"
		{ MaError. MaUnreadableRecoveryRecord . MagmaNoTransactionError . MaClientServerUserError . MaSoftwareError . MaObjectSerializationUserError . MagmaAlreadyInTransaction . MagmaWrongServerError . MaSpecialCollectionsSoftwareError . MagmaUnavailableCommitRecord . MagmaSoftwareError . MagmaDifferentBranch . MagmaSessionLost . MagmaEquivalentObjectNotInCollection . MaObjectSerializationSoftwareError . MaEnvironmentError . MagmaEnvironmentError . MagmaUserError . MaCorruptionError . MaUserError . MagmaCommitConflictError . MagmaCorruptionError . MagmaGarbageCollectedObject . MagmaDuplicateObjectInCollection . MagmaWrongCommitNumber . MagmaInvalidIndexObject . MagmaInvalidOid . MagmaCommitError . MaHashIndexUserError . MaMalformedRequestError . MagmaReadServerTooFarBehind }