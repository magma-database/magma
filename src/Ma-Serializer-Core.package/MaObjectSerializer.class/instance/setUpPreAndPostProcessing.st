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
	(Smalltalk hasClassNamed: #Project) ifTrue: 
		[ preferences 
			beforeSerializingAny: #Project
			do: 
				[ : aProject | 
				| world |
				world := aProject world.
				aProject world 
					setProperty: #optimumExtentFromAuthor
					toValue: aProject world extent.	"As suggested by Project>>#storeOnServerAssumingNameValid"
				(Smalltalk classNamed: #Utilities) ifNotNilDo: 
					[ : utilities | 
					"The following is from Project>>#exportSegmentWithChangeSet:fileName:directory:"
					utilities emptyScrapsBook ].
				world currentHand pasteBuffer: nil.	"don't write the paste buffer."
				world currentHand mouseOverHandler initialize.	"forget about any references here"
				"Display checkCurrentHandForObjectToPaste."
				(Smalltalk classNamed: #Command) ifNotNilDo: [ : command | command initialize ].
				world clearCommandHistory.
				world
					fullReleaseCachedState ;
					releaseViewers.
				world cleanseStepList.
				world releaseSqueakPages.
				(Smalltalk classNamed: #ScriptEditorMorph) ifNotNilDo: 
					[ : sem | 
					sem writingUniversalTiles: (aProject 
							projectParameterAt: #universalTiles
							ifAbsent: [ false ]) ].
				thisContext home removeSelf ].
		preferences 
			afterMaterializingAny: #Project
			do: 
				[ : aProject | 
				aProject setParent: (Smalltalk classNamed: #Project) current.
				aProject world beWorldForProject: aProject.	"sets aProject's worldState"
				"This behavior suggested by ImageSegment>>#comeFullyUpOnReload:"
				aProject ensureChangeSetNameUnique.
				(Smalltalk classNamed: #Project) addingProject: aProject.
				aProject restoreReferences.
				self maMarked: 'dev'.	"need to restore dependents??"
				(Smalltalk classNamed: #ScriptEditorMorph) ifNotNilDo: 
					[ : sem | 
					sem writingUniversalTiles: ((aProject projectPreferenceAt: #universalTiles) ifNil: [ false ]) ].
				thisContext home removeSelf ]
		"preferences
	afterMaterializingAny: #WorldState
	do:
		[ : aWorldState |
		aWorldState
			convertStepList ;
			convertAlarms ]." ]