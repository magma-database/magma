*magma-client
magmaLastUpdated
	"The DateAndTime this object was lastUpdated.  If this information is no longer available in the commit logs, nil."
	^ self magmaCommitLogRecord ifNotNil:
		[ : rec | rec timestamp ]