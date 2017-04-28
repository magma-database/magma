as yet unclassified
readmeText

	^'This package runs rigorous SUnit test scripts against Magma.

Temporary repository files must be created to run the test.  They will be created in a directory called ''Magma'' in the default directory unless you change it by executing:

	MaArmoredCodeOptions current testEnvironmentPath: (FileDirectory on: ''c:\temp\'')

When running the test cases, it is recommended to turn on debug mode.  Then, if an exception occurs in the server, it will halt there instead of returning that exception to the client and signaling it there.

	MagmaPreferences debug: true; debugProxies: false

  To kick off the test suite, execute:
	
	MagmaTestCase kickoff
'