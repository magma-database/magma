private
setUpNewRecordFor: keyInteger

	recordFactory preMadeNewRecord
		beZoomedInToward: keyInteger
			from: record;
		recordNumber: self getNextRecordNumber
