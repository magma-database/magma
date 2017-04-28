*magma client
maAllowsWriteBarrier
	"We cannot allow this because my override of #= uses my class instead of #species as part of that determination (it should use #species).  This probably isn't a big deal anyway, because Timespans are not typically modified anyway, they are Values, only new instances are created, so there would be no benefit from WriteBarrier anyway."
	^ false