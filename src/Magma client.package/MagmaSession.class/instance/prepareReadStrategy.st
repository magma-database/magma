private
prepareReadStrategy
	readStrategy ifNotNil: [ readStrategy makeReadyForUseUsing: serializer classIdManager ]