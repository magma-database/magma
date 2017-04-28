*magma client
maAllowsWriteBarrier
	"Sigh..  We cannot allow this because I override #= and use my #class as part of that determination.  Therefore, a ReadWriteStream behind a WriteBarrier will report false against an equivalent not behind a WriteBarrier.  I wonder whether objects behind WriteBarriers can answer their original class and then require it to override and use #basicClass or something like that to get its WriteBarrier subclass."

	^ false