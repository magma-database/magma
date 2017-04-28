accessing
allowLongCatchUp
	"If the session should find itself more than 100 commits behind, whether it should automatically catch itself up or whether a MagmaTooFarBehindError should be signaled.
	Most of the time, catching up from a long time ago is costly for both client and server, therefore the default is false.  Note however that MagmaTooFarBehindError is resumable."
	^ self attributeNamed: #allowLongCatchUp