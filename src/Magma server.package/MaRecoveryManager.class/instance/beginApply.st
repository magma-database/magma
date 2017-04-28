record
beginApply

	self preMadeBeginApplyRecord
		groupId: self getNextGroupId ;
		writeTo: applyFile  "no need to flush until the first ApplyRecord is written."