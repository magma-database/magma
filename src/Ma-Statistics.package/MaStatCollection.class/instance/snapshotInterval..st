accessing
snapshotInterval: anInterval 
	"An Interval that describes the period of the immediate past and the frequency to capture snapshots.  Specify the end-points of each temporal period.

For example, to specify history for the last 30 minutes, summarized every 5 minutes:

	5 to: 30 by: 5

To get minute-by-minute history for the last 24 hours:

	1 to: 24*60 by: 1

The first (receiver) Integer and the by: parameter will usually be the same."
	self historysDo: [ : each | each snapshotInterval: anInterval ]