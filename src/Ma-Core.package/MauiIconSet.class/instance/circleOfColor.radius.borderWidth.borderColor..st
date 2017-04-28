icons-constructed
circleOfColor: nougatColor radius: radiusInteger borderWidth: widthInteger borderColor: borderColor 
	^ SketchMorph withForm:
		((FormCanvas extent: radiusInteger @ radiusInteger)
			fillOval: ((0 @ 0) corner: (radiusInteger-1) @ (radiusInteger-1))
			color: nougatColor
			borderWidth: widthInteger-1
			borderColor: borderColor) form