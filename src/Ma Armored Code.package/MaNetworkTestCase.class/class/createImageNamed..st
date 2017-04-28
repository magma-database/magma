other squeak images
createImageNamed: aString

	| imageName changesName |

	imageName := aString, '.image'.
	MaNotification signal: 'deleting ', imageName.
	FileDirectory default deleteFileNamed: imageName.
	MaNotification signal: 'copying ', SmalltalkImage current imageName, ' to ', imageName.
	FileDirectory default
		copyFileNamed: SmalltalkImage current imageName
		toFileNamed: imageName.

	changesName := aString, '.changes'.
	MaNotification signal: 'deleting ', changesName.
	FileDirectory default deleteFileNamed: changesName.
	MaNotification signal: 'copying ', SmalltalkImage current changesName, ' to ', changesName.
	FileDirectory default
		copyFileNamed: SmalltalkImage current changesName
		toFileNamed: changesName