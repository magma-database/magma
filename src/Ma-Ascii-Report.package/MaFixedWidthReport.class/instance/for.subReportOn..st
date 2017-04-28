accessing
for: aClass subReportOn: oneArgBlock 
	"Causes the receiver to use oneArgBlock to retrieve a collection that will be reported on for each instance of aClass the report encounters."
	(subReports 
		at: aClass
		ifAbsentPut: [ OrderedCollection new ])
		add: oneArgBlock ;
		yourself