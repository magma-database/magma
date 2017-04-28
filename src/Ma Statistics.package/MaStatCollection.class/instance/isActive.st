accessing
isActive
	"My historys should only ever be started and stopped together, as a group."
	self historysDo: [ : anyOne | ^ anyOne isActive ].
	MaSoftwareError signal: 'never expected to reach here.'