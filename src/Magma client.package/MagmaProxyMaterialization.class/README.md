I am signaled when a mutating proxy is materialized.  The materializedObject is available as an argument.

To use:

	[ ... do your stuff ... ]
		on: MagmaProxyMaterialization 
		do:
			[ : theNotification |
			doSomethingWith: theNotification.
			theNotification resume "<-- very important!" ]

