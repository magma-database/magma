private
initializeWithTarget: aClass barrier: aBarrier
	barrier := aBarrier.
	class := self createSubclassOf: aClass.
	fieldsCache := Dictionary new.
	self installOverrides.