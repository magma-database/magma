validate
verifyIsVersion: versionNumber 
	self repositoryVersion = versionNumber ifFalse: [ MagmaUserError signal: 'Repository is not already version ' , versionNumber asString ]