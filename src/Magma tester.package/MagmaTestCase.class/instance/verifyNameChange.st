test class schema upgrades
verifyNameChange

	clientSession abort.
	self should: [ (clientSession root at: 'testClassSchemaUpgrades') name = 'Muller' ]