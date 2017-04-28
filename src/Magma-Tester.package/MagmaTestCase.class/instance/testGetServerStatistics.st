test transactions
testGetServerStatistics
	"For now, just see if we can retrieve the console statistics"
	| session serverStats |
	session := self newSessionAt: self class magmaServerLocation.
	serverStats := session serverStatisticsPrimary.
	self assert: serverStats class = MagmaServerStatistics.
	self assert: (serverStats historys allSatisfy: [ : each | (each instVarNamed: 'timer') isNil ])