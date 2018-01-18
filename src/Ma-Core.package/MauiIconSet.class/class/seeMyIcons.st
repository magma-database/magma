browse
seeMyIcons
	"Open palette of all my icons."
	| iconSelectors palette icons|
	palette := RectangleMorph new
		color: Color white ;
		layoutPolicy: TableLayout new ;
		listDirection: #leftToRight ;
		hResizing: #shrinkWrap ;
		vResizing: #shrinkWrap ;
		wrapDirection: #topToBottom ;
		extent: World extent // 2 ;
		cellInset: 10 ;
		yourself.
	iconSelectors := self iconSelectors.
	icons := self new.
	iconSelectors do: 
		[ : each | | labelledIcon |
		labelledIcon := RectangleMorph new
			layoutPolicy: TableLayout new ;
			listDirection: #topToBottom ;
			layoutInset: 4 ;
			hResizing: #shrinkWrap ;
			vResizing: #shrinkWrap ;
			color: Color transparent ;
			borderWidth: 0 ;
			yourself.
		labelledIcon 
			addMorph: (StringMorph contents: each) ;
			addMorph: ("SketchMorph withForm:" (icons perform: each)).
		palette addMorphBack: labelledIcon ].
	palette openInWorld