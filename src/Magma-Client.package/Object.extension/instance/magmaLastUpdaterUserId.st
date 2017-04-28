*magma-client
magmaLastUpdaterUserId
	"The userId of the last session that updated this object.  If this information is no longer available in the commit logs, nil."
	^ self magmaCommitLogEntry ifNotNil:
		[ : entry | entry connection userId ]