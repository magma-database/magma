accessing
asPainting
	| form |
	form := FormCanvas
		extent:
			(0 @ 0 corner:
				plots first form width @
					(plots
						inject: 0
						into:
							[ : sum : each | sum + each form height ])) extent
		depth: Display depth.
	plots
		inject: 0
		into:
			[ : totalHeight : each | form
				image: each form
				at: 0 @ totalHeight
				rule: Form blend.
			totalHeight + each height ].
	^ SketchMorph withForm: form form