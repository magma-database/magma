private
selectNewRecordFor: keyInteger
	"We need to make sure we reference the new record from the
	current record."

	self setUpNewRecordFor: keyInteger.
	"Reference new record and write before selecting the new record."
	record
		recordNumberAtSlotForKey: keyInteger
		put: recordFactory preMadeNewRecord recordNumber.
	self
		writeRecord; "replace record that now references newRecord.."
		selectPreMadeNewRecord
