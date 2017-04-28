test UDP ByteArray server
newBagFrom: start to: stop 
	^ ((start to: stop) collect: [ : n | n asWords ]) asBag