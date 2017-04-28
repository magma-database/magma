initialize-release
initializeDefaultSound
	defaultSound := ((FMSound new
		 addEnvelope:
			(VolumeEnvelope
				points: {0 @ 1.0. 1 @ 1.0}
				loopStart: 1
				loopEnd: 1) ;
			 yourself)
		setPitch: 210.0
		dur: 0.1
		loudness: 1.0 ;
		modulation: 2 ratio: 0.5)