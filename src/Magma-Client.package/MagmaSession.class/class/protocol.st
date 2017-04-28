accessing
protocol 
	"This is the protocol needed to talk to a magma server."
	^ { LargePositiveInteger. MaSerializedGraphBuffer.
		MaByteObjectBuffer . MaVariableWordBuffer . MaVariableObjectBuffer . MaFixedObjectBuffer . MaStorageObjectBuffer . MaVariableBuffer.  MaCompiledMethodBuffer.  MaMethodContextBuffer },
	"various requests"
		{MaLargeCollectionSizeRequest . MaTransactionRequest . MaReadRequest . MaCommitRequest . MaCommitLogRecordRequest . MaGetMcLockerRequest . MaWriteRequest . MagmaPathNameRequest . MaAnchorRequest . MaSaveAndExitImageRequest . MaRepositoryConnectionRequest . MaLoadFromReaderRequest . MaRepositoryDisconnectRequest . MagmaFullBackupRequest . MagmaIdRequest . MaLargeCollectionSegmentRequest . MaAbortTransactionRequest . MaReaderTrunkRequest . MaWarmBackupUpdateRequest . MagmaSwapPrimaryDutyRequest . MaLoadProgressRequest . MaSegmentByIndexRequest . MagmaServerStatisticsRequest . MaServerPerformRequest . MaPrimitiveAttributesRequest . MaRefreshRequest . MaDownloadCodeRequest . MaRefreshSegmentRequest . MagmaEnsureCorrectNodeConfiguration . MaReadMultipleRequest . MaAbstractReadRequest . MaKeyIntervalInfoRequest . MagmaRequestSwapPrimaryDutyRequest . MagmaBeWarmBackupRequest . MagmaNoteUnreachableServer. MaRemoveSecondaryLocationRequest. MaRawBufferRequest. MagmaReleaseReaderRequest. MagmaConnectionsRequest },
	"extra objects for some requests"
		{ MaCommitPackage.  MaBasicReadStrategy.  MaReadStrategy },
	"various results"
		{ MagmaCollectionSegment . MaRefreshViewResult . MaReadResult . MagmaLargeCollectionSegment . MaCommitResult . MagmaCollectionReaderSegment . MaFailedCommitResult. MaClientConnection },
	"extra objects for results"
		{ MagmaId. UUID. MagmaNode. MaFailedCommitResult. MagmaClientConnection. MagmaCommitConflict. Fraction. MaServerLocation. MaCommitLogEntry. MaCommitLogRecord }, 
		{MagmaLocalLocation . MagmaRemoteLocation . MagmaLocation},
	"Statistics querys"
		{ Interval. DateAndTime. Duration. MaHistoricalStat. MaStatHistory. MagmaServerStatistics },
	"query expressions"
		{ MagmaClause . MagmaExpression . MaQueryTrunkClause. MaQueryTrunk },
	"MagmaCollections"
		{MagmaSet . MagmaCollection. IdentityDictionary.  MaIdentityDictionary.  MagmaIndexDescription },
	"large-collection changes"
		{ MagmaCollectionChanges . MagmaArrayChanges . MagmaSetChanges },
	"parts of MagmaCollectionChanges"
		{ Association.  MaChangedKeySpecification },
	"exceptions"
		{ MaError. MaUnreadableRecoveryRecord . MagmaNoTransactionError . MaClientServerUserError . MaSoftwareError . MaObjectSerializationUserError . MagmaAlreadyInTransaction . MagmaWrongServerError . MaSpecialCollectionsSoftwareError . MagmaUnavailableCommitRecord . MagmaSoftwareError . MagmaDifferentBranch . MagmaSessionLost . MagmaEquivalentObjectNotInCollection . MaObjectSerializationSoftwareError . MaEnvironmentError . MagmaEnvironmentError . MagmaUserError . MaCorruptionError . MaUserError . MagmaCommitConflictError . MagmaCorruptionError . MagmaGarbageCollectedObject . MagmaDuplicateObjectInCollection . MagmaUnconnectableSessionError. MagmaWrongCommitNumber . MagmaInvalidIndexObject . MagmaInvalidOid . MagmaInvalidReference . MagmaCommitError . MaHashIndexUserError . MaMalformedRequestError . MagmaReadServerTooFarBehind }