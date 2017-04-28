test class schema upgrades
setContactMethodsAndCode
	clientSession commit: 
		[ self maMarked: 'magic'.	"setting contactMethods: works due to DNU override in MagmaTestObject"
		(clientSession root at: 'testClassSchemaUpgrades') contactMethods: (Dictionary new
				at: #address
					put: '101 W. Meyer' ;
				yourself) ].
	"Test renaming the class too."
	clientSession commit: 
		[ (Smalltalk classNamed: #MagmaContact) rename: #MagmaRenamedContact.
		#(#MagmaRenamedContact #MagmaPerson ) do: [ : each | clientSession definition codeBase fileOutClass: (Smalltalk at: each) ] ]