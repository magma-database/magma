player access
setTestCaseClass: aClass
	"Make sure you have first updated the ChangeSet that contains your test case class, or the player may not be able to instantiate it."

	MaArmoredCodeNotification signal: 'setting test case class to ', aClass name, ' in ', name.
	^self submit:
		(MaSetTestCaseClassRequest new
			testCaseClass: aClass;
			yourself)
