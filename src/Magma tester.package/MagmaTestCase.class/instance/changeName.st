test class schema upgrades
changeName
	"This should warn us we're about to truncate data because this clients MagmaPerson doesn't have address."
	clientSession refresh.
	2 timesRepeat: 
		[ self should: 
			[ 
			[ clientSession commit: [ (localRoot at: 'testClassSchemaUpgrades') name: 'Muller' ].
			false ] 
				on: MagmaTruncationWarning
				do: 
					[ : warning | 
					clientSession abort.
					(warning messageText findString: 'MagmaPerson') > 0 ] ] ].

	"Now load the latest code committed by another client so we don't get that warning."
	clientSession definition codeBase installClasses.
	"gotta stub it out so it re-reads it, otherwise warning will continue.."
	clientSession stubOut: (localRoot at: 'testClassSchemaUpgrades').
	clientSession commit: [ (localRoot at: 'testClassSchemaUpgrades') name: 'Muller' ].
	self maMarked: 'magic'.	"calling contactMethods works due to DNU override in MagmaTestObject"
	self should: 
		[ (localRoot at: 'testClassSchemaUpgrades') contactMethods = (Dictionary new
				at: #address
					put: '101 W. Meyer' ;
				yourself) ]