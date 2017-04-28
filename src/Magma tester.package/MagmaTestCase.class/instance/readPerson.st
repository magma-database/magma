test class schema upgrades
readPerson
	"Read an old version of the Person instance."
	clientSession refresh.
	localRoot 
		at: 'testClassSchemaUpgrades'
		put: (clientSession root at: 'testClassSchemaUpgrades')