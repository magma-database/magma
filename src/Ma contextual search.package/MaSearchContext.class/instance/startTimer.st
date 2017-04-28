private
startTimer
	timer := MaTimer new 
		in: (self preferred: #maximumScanTime)
		do: 
			[ "nothing, we only will check whether the timer has #expired."
			 ]