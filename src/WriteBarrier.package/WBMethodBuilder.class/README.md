A WBMethodBuilder generates an override of a single method which could potentially alter the receiver's inst-vars.  First, it stores each of the receivers inst-vars into temp vars, calls super, then compares each of the temp-vars to the inst-vars.  If any are different, then "self writeBarrier modified: self" is called.

The method source would be something like this:

addValue: t1 
	| t2 t3 t4 t5 t6 |
	t2 := self instVarAt: 2.
	t3 := self instVarAt: 3.
	t4 := self instVarAt: 4.
	t5 := self instVarAt: 5.
	t6 := super addValue: t1.
	t2 == (self instVarAt: 2) ifFalse:
		[ self writeBarrier modified: self.
		^ t6 ].
	t3 == (self instVarAt: 3) ifFalse:
		[ self writeBarrier modified: self.
		^ t6 ].
	t4 == (self instVarAt: 4) ifFalse:
		[ self writeBarrier modified: self.
		^ t6 ].
	t5 == (self instVarAt: 5) ifFalse:
		[ self writeBarrier modified: self.
		^ t6 ].
	^ t6