example
example1
	| clientProcess monitoredBlock n delay |
	delay := Delay forMilliseconds: 2.
	n := 0.
	clientProcess := nil.
	monitoredBlock := 
	[ clientProcess progressor
		taskSize: 10000 ;
		unitsVerbPhrase: 'milliseconds waited'.
	"Your block should check the clientProcess #shouldStop user request frequently to support a graceful cancel."
	[ n < 10000 and: [ clientProcess shouldStop not ] ] whileTrue: 
		[ "Here is the work..."
		n := n + 1.
		clientProcess progressor description: 'working on ' , n printString.
		delay wait.
		clientProcess progressor advance.
		"After your work code, you should also allow the clientProcess to support #pause and #resume by waiting for it gracefully in your work code.
		The reason to put it at the end of your work code, rather than the beginning, is in case you pause, THEN stop.  Stop must resume to resume the loop to immediately exit rather than process one more loop of work."
		clientProcess waitForResume ].
	"This is important to support a graceful cancel.."
	clientProcess stopped 
		ifTrue: [ clientProcess signalWaiterOnStop ]
		ifFalse: [ clientProcess progressor description: 'Counting complete.' ] ].
	clientProcess := (MaClientProcess doBlock: monitoredBlock)
		name: 'Counting for Testing Progress Bar' ;
		yourself.
	clientProcess
		start ;
		inspect