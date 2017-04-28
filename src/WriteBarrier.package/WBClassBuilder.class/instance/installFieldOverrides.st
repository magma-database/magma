private
installFieldOverrides
	| fields |
	self allSelectorsDo:
		[:ea |
		fields := self fieldsWrittenToBySelector: ea.
		fields isEmpty ifFalse: [self installOverrideOf: ea fields: fields]]