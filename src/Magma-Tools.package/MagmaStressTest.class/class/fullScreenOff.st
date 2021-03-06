private
fullScreenOff
	(Smalltalk classNamed: #ScreenController)
		ifNotNilDo: [:sc | sc new fullScreenOff].
	"Easier window management in the OS by sizing the windows down.."
	(Smalltalk classNamed: #Display)
		ifNotNilDo: 
			[ : disp | 
			disp class
				depth: Display depth
				width: Display width * 3 // 4
				height: Display height * 3 // 4
				fullscreen: false].
	(Smalltalk classNamed: #World)
		ifNotNilDo: [:world | world doOneCycleNow]