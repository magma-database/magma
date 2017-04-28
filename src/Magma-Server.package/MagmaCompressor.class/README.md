I garbage collect a Magma repository and output a smaller file by eliminating buffers no longer referenced from the root buffer.

I always create a new object file, but if you use compressAndRename, I'll rename the source files to 'old...' so you can get with using the compressed repository right away.

If you don't want me to rename, just use #compressTo:.

Oh, and I'm not meant to work while the files are on-line.  For that, use:

	yourRepositoryController garbageCollect

(Note:  a potential strategy for on-line GC would be to set a boolean flag indicating to the filer not to reuse buffers made available through grown objects, but rather to always add to the end.  During this time, a background thread can start reading from the root and build a new copy of the 'memory' map (the MaIntervalCollection).  Once it has accounted for every byte in the real memory map, we know the real one can be replaced with this new one.  Do a quick write of the new memory map and you're done!)