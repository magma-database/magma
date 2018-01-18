private
darkColors
	"Answer the Array of colors to be used for each of my Series on a light or white background."
	^ series size > 8
		ifTrue: [ Color blue twiceDarker wheel: series size ]
		ifFalse: [ {Color blue. 
			Color yellow duller.
			Color green. 
			Color red. 
			Color cyan blacker. 
			Color orange. 
			Color brown. 
			Color lightMagenta blacker} ]