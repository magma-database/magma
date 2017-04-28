private
saveAndExitAs: imageName 
	"Save the image under the name, imageName."
	self fullScreenOff.
	SmalltalkImage current maSaveAs: (SmalltalkImage current fullNameForImageNamed: imageName).
	SmalltalkImage current 
		snapshot: true
		andQuit: true