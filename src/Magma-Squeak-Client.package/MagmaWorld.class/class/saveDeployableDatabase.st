actions
saveDeployableDatabase
	| appName |
	appName := UIManager default
		request: 'app name? (terse)'
		initialAnswer: 'myapp'.
	appName isEmptyOrNil ifFalse: [ self saveDeployableDatabaseNamed: appName ]