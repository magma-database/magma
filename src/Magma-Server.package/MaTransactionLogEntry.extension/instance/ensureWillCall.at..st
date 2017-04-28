*magma-server
ensureWillCall: specialOidsName at: oidInteger

	(serverNotifications
		at: specialOidsName  "see MaObjectRepository>>#initializeSpecialOidsList"
		ifAbsentPut: [ Set new ]) add: oidInteger