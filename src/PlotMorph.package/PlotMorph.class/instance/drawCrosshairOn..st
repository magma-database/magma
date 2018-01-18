drawing
drawCrosshairOn: aFormCanvas 
	| width |
	lastHandPosition ifNil: [ ^ self ].
	width := 1.
	(crosshairStyle == #vertical or: [ crosshairStyle = #cross ]) ifTrue:
		[ aFormCanvas
			line: lastHandPosition x @ self top
			to: lastHandPosition x @ self bottom
			width: width
			color: crosshairColor ].
	(crosshairStyle == #horizontal or: [ crosshairStyle = #cross ]) ifTrue:
		[ "From hand to right."
		aFormCanvas
			line: self left @ lastHandPosition y
			to: self right @ lastHandPosition y
			width: width
			color: crosshairColor ]