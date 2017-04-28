I am used to signal to the session controller a session directive, such as connect, commit, abort, disconnect, or others.

Use my class-side api in your domain code.  For example, in your setters:

	name: aString
		MagmaSessionRequest signalCommit: [ name _ aString ]

When Magma is not used, the session request has no effect.