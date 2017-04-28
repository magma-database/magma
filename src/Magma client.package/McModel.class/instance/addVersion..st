packages
addVersion: aMCVersion 
	"Reference aMCVersion by several different access keys."
	(objects
		
		at: aMCVersion id
		put: aMCVersion ;
		
		at: aMCVersion versionName
		put: aMCVersion ;
		
		at: aMCVersion packageName
		ifAbsentPut: [ self newVersionsCollection ]) add: aMCVersion