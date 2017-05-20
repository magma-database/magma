initializing
setUpPreAndPostProcessing
	"Initiailize the pre and post-materializers for classes that come with standard Squeak.  Base Squeak uses one of two methods for serializing objects; ReferenceStream and ImageSegments.  MaObjectSerialization more-closely resembles ReferenceStream.  While the setup for these processors is based on the behavior in those other two frameworks, there are bound to be some minor differences."
	self setUpClassDefinitionProcessing.
	preferences
		afterMaterializingAny: #Form
		do: [ : aForm | aForm maCheckBits ].

	"preferences
	beforeSerializingAny: #Form
	do: [ : aForm | aForm hibernate ].
preferences
	afterSerializingAny: #Form
	do: [ : aForm | aForm unhibernate ]."
	"preferences
	beforeSerializingAny: #ColorForm
	do: [ : aColorForm | aColorForm clearColormapCache ]."
	preferences 
		beforeSerializingAny: #Morph
		do: 
			[ : aPasteUpMorph | 
			aPasteUpMorph prepareToBeSaved.	"Amen"
			thisContext home removeSelf ].
	"preferences
	afterSerializingAny: #ScriptEditorMorph
	do: [ : aScriptEditorMorph | aScriptEditorMorph class = BooleanScriptEditor ifFalse: [ aScriptEditorMorph unhibernate ] ].
preferences
	afterMaterializingAny: #ScriptEditorMorph
	do: [ : aScriptEditorMorph | aScriptEditorMorph class = BooleanScriptEditor ifFalse: [ aScriptEditorMorph unhibernate ] ]."
	preferences 
		beforeSerializingAny: #TTCFont
		do: 
			[ : aTTCFont | 
			aTTCFont flushCache.
			thisContext home removeSelf ].

	"preferences
		beforeSerializingAny: #Wonderland
		do: [ : aWonderland | aWonderland prepareToBeSaved ].
preferences
	beforeSerializingAny: #ViewerFlapTab
	do: [ : aViewFlapTab | aViewFlapTab hibernate ]."
	self maMarked: 'dev'.
	"You've got this commented out because it changes the shape of the object while you're serializing it, which ends up causing the graphBuffer to not be #isWhole (which causes problems on materialization).
Do we need this?  It appears that Project>>exportSegmentWithChangeSet:  fileName:  directory: calls it at the end.  Also, Project>>exportSegmentWithCatagories: classes: fileName: directory:"
	"preferences
	afterSerializingAny: #ViewerFlapTab
	do: [ : aViewerFlapTab | aViewerFlapTab unhibernate ].
preferences
	afterMaterializingAny: #ViewerFlapTab
	do: [ : aViewerFlapTab | aViewerFlapTab unhibernate ]."
	preferences
		beforeSerializingAny: #CompiledMethod
			do: [ : aCompiledMethod | aCompiledMethod fixForWriteBarrier ] ;
		beforeSerializingAny: #MethodContext
			do:
				[ : aMethodContext | aMethodContext removeSelf.
				1 to: aMethodContext numArgs do: [ : n | aMethodContext tempAt: n put: nil ] ] ;
		afterMaterializingAny: #MethodContext
			do: [ : aMethodContext | aMethodContext privRefresh ].