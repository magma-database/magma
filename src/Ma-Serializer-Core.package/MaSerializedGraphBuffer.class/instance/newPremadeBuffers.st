private creation
newPremadeBuffers

	^MaObjectBuffer bufferClasses collect: [ :each | each new ]
