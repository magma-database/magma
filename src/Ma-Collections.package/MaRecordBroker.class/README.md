I am an abstract superclass for record-based collections such as MaHashIndex and MaLargeArrayOfNumbers.  By plugging them with my appropriate subclass, they are able to be file-based or in-memory (or maybe remote network location in the future).

I don't actually deal with the records themselves, just their reading and writing to the storage.