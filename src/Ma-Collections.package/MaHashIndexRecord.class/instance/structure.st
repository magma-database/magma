debugging
structure

	^ String streamContents: [ : stream | self dumpStructureTo: stream ]