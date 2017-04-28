*magma-client
magmaLastUpdaterSessionId
	"The sessionId (UUID) of the last session that updated this object.  If this information is no longer available in the commit logs, nil."
	^ self magmaCommitLogEntry ifNotNil:
		[ : entry | entry connection sessionId ]