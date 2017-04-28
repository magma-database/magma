private
rebuildMethods
	self allSelectorsDo: [:ea | self checkOverrideOf: ea]