*magma tester
maFileInAnnouncing: announcement logged: aBoolean
	"This is special for reading expressions from text that has been formatted 
	with exclamation delimitors. The expressions are read and passed to the 
	Compiler. Answer the result of compilation.  Put up a progress report with
     the given announcement as the title."
	| val chunk |
	[announcement displayProgressAt: Sensor cursorPoint
		from: 0 to: self size
		during:
		[:bar |
		[self atEnd]
			whileFalse: 
				[bar value: self position.
				self skipSeparators.
				[
					val := (self peekFor: $!) ifTrue: [
						(Compiler evaluate: self nextChunk logged: false) scanFrom: self
					] ifFalse: [
						chunk := self nextChunk.
						self checkForPreamble: chunk.
						Compiler evaluate: chunk logged: aBoolean
					].
				]
					on: InMidstOfFileinNotification
					do: [ :ex | ex resume: true].
				self skipStyleChunk]]]
		ensure:[self close].
	"Note:  The main purpose of this banner is to flush the changes file."
	SmalltalkImage current logChange: '----End fileIn of ' , self name , '----'.
	SystemNavigation new allBehaviorsDo: [ :cl | 
		cl basicRemoveSelector: #DoIt; basicRemoveSelector: #DoItIn:
	].
	^ val