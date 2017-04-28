as yet unclassified
degradationTest
	| hdx random |
	hdx := MaHashIndex 
		create: (MaAtomicFileStream fileNamed: '_testDegradation.hdx')
		keySize: 32
		valueSize: 48
		recordSize: 8.
	random := Random seed: 51969.
	100 timesRepeat: 
		[ Transcript
			cr ;
			show: hdx size ;
			show: ' --> ' ;
			show: 
				[ 10000 timesRepeat: 
					[ hdx 
						add: 1
						at: (random nextInt: 4294967295) ] ] durationToRun ]