This class emulates a StandardFileStream except doesn't actually write contents to disk until you send #maCommit.  Instead, it caches the written contents to a collection of MaAtomicFileWriters.

Also, the latest additional feature is that it can be of unlimited size, it reads and writes its multiple physical 'fileStreams' depending on what the file-position requested is.