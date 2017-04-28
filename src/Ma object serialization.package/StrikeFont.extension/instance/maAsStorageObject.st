*ma object serialization
maAsStorageObject 

	^ DiskProxy
		global: #StrikeFont selector: #familyName:size:emphasized:
		args: { self familyName.  self height.  self emphasis }