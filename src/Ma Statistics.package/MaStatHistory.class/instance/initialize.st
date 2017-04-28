initialize-release
initialize
	super initialize.
	history := OrderedCollection new.
	guard := Mutex new.
	"Keep 5-minute snapshots of the last 4 days (an entire holiday weekend) at all times."
	self snapshotInterval: (5 to: 60*24*4 by: 5)