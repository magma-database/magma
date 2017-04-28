*magma server
nodeCheck
	console ifNil: 
		[ MagmaUserError signal: self class name , ' only applies when the repository is deployed on-line, with at least two servers forming a HA node.' ].
	console restoreMode ifFalse: [ MagmaUserError signal: 'Repository is not a warm-backup.' ].
	"Obtain the latest-possible view of the node."
	repositoryController session abort.
	(self node includesServerAt: self thisLocation) ifFalse: 
		[ MagmaEnvironmentError signal: 'Node should include the secondary requesting primary duty.' ].
	self shouldBeSecondary