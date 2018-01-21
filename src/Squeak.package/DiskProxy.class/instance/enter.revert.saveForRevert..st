exceptions
enter: returningFlag revert: revertFlag saveForRevert: saveForRevert
	"Look for our project on the server, then try to enter it!  DiskProxy is acting as a stub for the real thing.  Called from a ProjectViewMorph in the current project.  If have url, use it.  Else look in current Project's server and folder."

	constructorSelector == #namedUrl: ifTrue: ["Project namedUrl: xxx"
		^ ((Smalltalk at: globalObjectName) perform: #fromUrl:
					withArguments: constructorArgs) ].
	constructorSelector == #named: ifTrue: [
		Project current fromMyServerLoad: constructorArgs first].	"name"
