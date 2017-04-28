private
magmaStatClassIds
	| ids |
	ids := Set new.
	self definition classDefinitions keysAndValuesDo:
		[ : eachId : each | | candidate |
		candidate := eachId.
		each anyOne withAllSuperclassDefinitionsDo:
			[ : eachDef | eachDef className = #MagmaStat ifTrue:
				[ ids
					 add: candidate ;
					 add: eachDef id ] ] ].
	^ ids