private
performTest
	[ self
		notify: 'running ' , self selector , '.. ' ;
		notify: 'time to run ' , self selector , ':  ' , [ super performTest ] durationToRun printString ] 
		on: MaNotification
		do: 
			[ : n | 
			Transcript
				cr ;
				show: n messageText.
			n resume ]