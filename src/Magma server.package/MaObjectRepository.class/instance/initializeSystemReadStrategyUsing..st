accessing
initializeSystemReadStrategyUsing: aMaClassIdManager 
	"The object and its immediate variables"
	systemReadStrategy := MaReadStrategy minimumDepth: 1.
	systemReadStrategy makeReadyForUseUsing: aMaClassIdManager