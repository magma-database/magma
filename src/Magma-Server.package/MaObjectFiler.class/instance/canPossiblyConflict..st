private
canPossiblyConflict: eachObjectBuffer
	^ (eachObjectBuffer classId = MagmaClassIdManager magmaCounterClassId) not and: [ (magmaStatClassIds includes: eachObjectBuffer classId) not ]