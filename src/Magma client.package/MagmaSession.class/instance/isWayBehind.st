testing
isWayBehind
	"Answer whether this session is further behind in its commitNumber than it is in its total number of cached objects.  Used to determine the fastest path to getting caught up."
	^ guard critical: 
		[ self remotePrimitiveAttributesDo: 
			[ : attrs | 
			| remoteCommitNumber remoteOidCount |
			remoteCommitNumber := attrs at: #commitNumber.
			remoteOidCount := attrs at: #oidCount.
			"Now answer whether we are more objects *behind* than there are total objects in the image (for this session)"
			remoteCommitNumber - self commitNumber > (remoteOidCount - self oidCount) ] ]