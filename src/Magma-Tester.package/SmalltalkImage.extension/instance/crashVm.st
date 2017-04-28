*magma-tester
crashVm
	"The following will crash Spur 3306 VM"
	| form canvas fill direction normal |
	"The following will crash Spur 3306 VM"
	direction := 1@0.
	normal := 1@0.
	form := Form extent:300@300 depth:32.
	canvas := form getCanvas.
	fill := GradientFillStyle new colorRamp:{0 -> Color white . 0.5 -> Color green . 1 -> Color blue};origin:150@150;direction:direction;normal:normal;radial:true;yourself.
	canvas fillRectangle: (50@50 extent:200@200) fillStyle: fill.
	Display getCanvas drawImage: form at: 300@300.
"	Warning signal: 'The VM was supposed to crash.  quitPrimitive instead but this is not as good a test because it flushes open files...'."
	Smalltalk quitPrimitive