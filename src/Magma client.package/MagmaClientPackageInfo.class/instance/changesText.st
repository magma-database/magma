as yet unclassified
changesText

	^'
1.0gamma8
	- Live class evolution.  Developers can stay connected to Magma repositories while changing class-definitions and Magma will "do the right thing".
	- Magma can now serve as a code-repository for individual classes, change sets and Monticello packages.  The Monticello UI can be used with Magma as the back-end.
	- Support for many more classes such as BlockContexts, MethodContexts, CompiledMethods, Metaclasses (by reference), SortedCollections, WeakSets, billion-object Bags and Intervals, PluckedSounds, Speaker (i.e., Klatt) and other Variable-word classes are also supported.
	- Nested transactions.  You can now have multiple-levels of transactions and only the outer-most one actually writes them all to the repository.
	- Support for transient variables.  You can now specify named variables that you don''t want persisted in the repository.
	- stale proxies from disconnected sessions, if provoked, will now try to find the new session and reconnect automatically.
	- support for MagmaRepositoryLink objects that can be used to create a session to a local or remote repository without caring about the type of connection.
	- MagmaCollection improvements.  New large collections, MagmaSet and MagmaDictionary, MagmaIdentityDictionary and MagmaArray.
	- Better error handling.
	- Lots of code trimmed.  An entire package, a couple of class-hierarchies, and roughly 100 extension methods to base-classes were cleaned out thanks to various refactorings.

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


1.0gamma4

Enhancements:
	- A new MagmaSessionRequest notification provides a flexible, simple way to signal any session behavior, such as begin and commit from deep within domain classes without them needing to reference a MagmaSession.
	- Support for Morphs.
	- A new session preference is available.  When signalChangedNotifications is set to true, then, upon crossing of every transaction boundary, all objects in your image that were changed by other users will be sent #magmaChanged, the stub implemented on Object does nothing.
	- A substantial performance improvement on commits.
	- Tweaked default read-depth down to 2, from 3 seems to have
	- MagmaSession>>commitAndBegin is a new method that allows you to commit your current transaction and begin a new one within a single call the server.  This can be used to further improve performance to "load scripts."
	- Use MagmaSession>>cachedObjectCount to keep tabs on the how much of the persistent model is in memory, referenced by the program.  There are also new stats on the server side such as number of objects in the repository.
	- A new MagmaPreferences global attribute, handStatus, now determines whether the Hand will change to the "write" cursor when committing, the "read" cursor when reading, and the "up" cursor when waiting on the server for anything else.  While mostly just a curiousity, it also allows eyeball-profiling of the time spent in the client vs. the server so you can assess whether your commits are appropriately sized.
  - The "root trap" has been eradicated.  Your session will now reference the root every time you begin a transaction and dereferenced as soon as you commit or abort.  Since your transactions will presumably be short, there should be no problem with accumulating too much of the database in memory.

Bug fixes:
  - Fixed doesNotUnderstand: error with the MagmaRepository>>delete: utility method.
  - Improved a bug with materializing proxy''s to Symbols.  It''s slower than other kinds of objects, but should work as long as you never try to materialize a system-needed selector such as #size or #yourself or #add:.  Due to a bug with Squeak''s becomeForward: primitive (the modification of the target objects hash bits), you must be sure to use ReadStrategies to ensure these Symbols NEVER get proxied, or the becomeForward: could lock up Squeak.  So, this includes the actionSelectors of your Morph''s.  For more information, see http://lists.squeakfoundation.org/pipermail/squeak-dev/2003-March/055383.html, or to demonstrate the problem for yourself, evaluate the following (be sure you have saved your image first!):

	String new becomeForward: #size

1.0gamma3:
  - MagmaCollections performance improvement
  - Better support for multiple sessions in the same image, connected to the same remote repository

1.0gamma2:
  - minor bug fixes
  - compatibility with Linux filenames / endianness

1.0gamma:
  - initial SqueakMap release'