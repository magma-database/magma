private
lightColors
	"Answer the Array of colors to be used for each of my Series on a dark or black background."
	^ series size > 8
		ifTrue: [ Color blue wheel: series size ]
		ifFalse: [ {Color blue. 
			Color yellow. 
			Color green. 
			Color red. 
			Color cyan. 
			Color orange. 
			Color paleGreen. 
			Color lightRed} ]