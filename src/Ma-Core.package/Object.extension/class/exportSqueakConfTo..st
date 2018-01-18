*ma-core
exportSqueakConfTo: aFileDirectory
	aFileDirectory
		fileNamed: 'squeak.conf'
		do:
			[ : stream | stream
				lineEndConvention: #lf ;
				maPrint:
'*       hard    rtprio  2
*       soft    rtprio  2' ]