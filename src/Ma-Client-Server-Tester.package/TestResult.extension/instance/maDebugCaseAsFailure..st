*ma-client-server-tester
maDebugCaseAsFailure: aTestCase

	aTestCase halt runCase.
	self passed add: aTestCase
