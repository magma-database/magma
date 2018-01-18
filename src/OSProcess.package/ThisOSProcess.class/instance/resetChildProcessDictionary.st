updating
resetChildProcessDictionary
	"Forget all the entries in the allMyChildren dictionary. This method may be called
	when a new session is started, since the child processes of the previous session are
	no longer children of this process."

	self allMyChildren do: [ :p | self unregisterChildProcess: p ]
