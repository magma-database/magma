private-reporting
reportDefinition
	^ MaFixedWidthReport new
		for: MaStatHistory
			use: self statHistoryRowSpec ;
		for: MaStatHistory
			subReportOn: [ : eachStatHistory | eachStatHistory allStats ] ;
		for: MaStatHistory
			subReportOn: [ : eachStatHistory | Array with: eachStatHistory summary ] ;
		for: MaHistoricalStat
			use: self historicalStatRowSpec ;
		yourself