accessing
primaryLocation
	"Had to use this temporary or else Spur fails in HA test-case 4, Swap Primary Duty because it thinks locations is the first inst-var of the Proxy.  Weird!"
|locs| locs:=locations.
	^ locs notEmpty ifTrue: [ locs first ]