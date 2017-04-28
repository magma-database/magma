performance
useCompression: aBoolean 
	self compressThreshold: (aBoolean 
			ifTrue: [ MaClientSocket mtuSize ]
			ifFalse: [ MaSerializedGraphBuffer unreasonablePhysicalSize * 2 ])