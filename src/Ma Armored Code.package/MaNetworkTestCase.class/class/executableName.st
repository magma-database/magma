other squeak images
executableName
	"Florian said SmalltalkImage current getSystemAttribute: 0 does not work for him on his Linux, 
		http://lists.squeakfoundation.org/pipermail/magma/2007-September/000831.html
	so we have this check for Unix."
	^ ((Smalltalk hasClassNamed: #OSProcess) and: [ (Smalltalk classNamed: #OSProcess) isUnix ]) 
		ifTrue: [ (Smalltalk classNamed: #OSProcess) programName ]
		ifFalse: [ SmalltalkImage current getSystemAttribute: 0 ]