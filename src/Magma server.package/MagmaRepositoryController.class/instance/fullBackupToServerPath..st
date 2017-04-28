backup / restore
fullBackupToServerPath: pathString 
	"Backup the repository to the directory identified by pathString while the repository is open.  If there is a Magma repository at pathString, all files will be deleted ahead of time, otherwise none will."
	| didDelete |
	didDelete := false.
	[ self fullBackupTo: (MagmaLocalLocation path: pathString) directory ] 
		on: MagmaDeleteWarning
		do: 
			[ : warn | 
			didDelete := true.
			warn resume ].
	^ didDelete 
		ifTrue: [ 'Backup at ' , pathString , ' is being replaced with a new backup.' ]
		ifFalse: [ 'A new backup is being created at ' , pathString ]