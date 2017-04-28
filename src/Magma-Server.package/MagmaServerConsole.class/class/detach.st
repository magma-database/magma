linux-scripts
detach
	^ 'sudo setuidgid magma spur -vm display=none server-spur.image detach.st'
		-> [Smalltalk runAndQuit: ['model' asMagmaLocalLocation detachFromNode]]