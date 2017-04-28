private
validateDomainVersion
	^ self domainVersion = self class domainVersion ifFalse: [ MagmaUserError signal: 'This repository is version ' , self domainVersion asString , ' but you are running version ' , self class domainVersion , ' of the code.  Please disconnect immediately and run the upgrade utility.' ]