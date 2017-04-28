linux-scripts
testAppend
	^ 'spur -vm display=none update-spur testAppend.st $1 > testAppend.log 2>&1' ->
		[ Smalltalk runAndQuit:
			[ : stringToAppend | FileStream
				fileNamed: 'testAppend.out'
				do:
					[ : stream | stream
						setToEnd ;
						lf ;
						maPrint: DateAndTime now ;
						space ;
						maPrint: stringToAppend ] ] ]