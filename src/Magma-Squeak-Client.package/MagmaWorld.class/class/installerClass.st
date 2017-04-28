override
installerClass
	"Applications provide thier own subclass of MagmaWorldMainDockingBar."
	^ (Smalltalk classNamed: #MyInstaller) ifNil: [ MaInstaller ]