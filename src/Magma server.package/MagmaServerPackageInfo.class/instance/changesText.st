as yet unclassified
changesText

	^'
1.0gamma8
	- removed "allowNewClasses" feature.  This will be handled with real security later.
	- all administration functions are now either remote requests or no longer needed.
	- support for first-class MagmaRepositoryCodeBase.

1.0gamma7
	- Compatible with Squeak 3.7.
	- Better support for Symbols (thanks to Brent Pinkney!).
	- fix for storing Exceptions in the repository (to accommodate changes in Squeak 3.6).
	- New Date index type for MagmaCollections.
	- New Float index type for MagmaCollections.
	- MagmaSessions cleaned from MethodContext receivers, allowing full garbage collection (thanks to Giovanni!).
	- Critical bugs with MagmaCollections fixed and now pass the new, extra-stringent tests in the Tester package.
	
1.0gamma6
	- works with Squeak 3.6.  Doesn''t work with versions before 3.6.
	- fixed issue with servers that were running when the image was saved (functionality implemented in 1.0gamma5).  Fixed similar bug for saving with open local repository connections.
	- disconnect now cleans up the proxies for that session.  Please be patient, this can take a while if you have a lot.  Also now cleaning dynamic largeCollection attributes when disconnecting a session.
	- fixed bug with creating repository using an unqualified file name.
	- fixed an unnoticed reference to platform-specific code (ByteArray>>unsignedByteAt: uses FFI primitives).
	- improved the internal system-read-strategy.


1.0gamma5
	- Servers and clients can now survive image restarts.
	- added a new session preference (see MagmaPreferences), "signalProxyMaterialization" so you can capture MagmaNotifications and fine-tune your read strategies.
	- Another performance improvement!  ReadStrategies are now cached on the server, instead of in your MagmaSession, improving read-efficiency when using read strategies because the strategy-object no longer needs to be serialized and transported for every proxy materialization.  Additionally, ReadStrategies for classes that don''t exist in the repository are no longer dropped.  Instead, they are remembered until you put those classes into the repository.
	- commit conflicts no longer provide the entire MagmaClientConnection object who conflicted with your session, just the userId.  This is due to the aforementioned cached readStrategy, no need to be sending that down on a commit conflict.
	- Since we have eradicated the "root trap" we can make replacing the root consistent with other Magma changes.  A transaction is now required.
	- several bug fixes.
'