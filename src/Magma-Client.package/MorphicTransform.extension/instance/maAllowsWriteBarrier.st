*magma-client
maAllowsWriteBarrier 
	"Had a problem where this guy was losing his writeBarrier (nil) and so was blowing when it was modified.  Thought it had something to do with the fact that I was copied, but my testing shows the copy maintains access to the same WriteBarrier."

	^ false
	
"Seems like it should be ok..  What gives??
| mt1 mt2 mt3 mt4 wb |
wb := WriteBarrier new.
mt1 := self offset: 2@3.
wb add: mt1.
mt2 := mt1 withOffset: 3@4.
mt3 := mt2 withOffset: 4@5.
mt4 := mt1 withOffset: 5@6.
{ mt1. mt2. mt3. mt4 } do: [ : e | e setAngle: Float pi ].
{ mt1. mt2. mt3. mt4 } do: [ : e | e writeBarrier == wb ifFalse: [ self halt ] ].
{ mt1. mt2. mt3. mt4 } do: [ : e | wb remove: e ]
"