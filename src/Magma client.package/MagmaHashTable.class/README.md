A MagmaHashTable is similar to a MagmaCollection except:

	- It can only query a range of one indexed attribute using #from:to:do:.
	- It can't randomly access via #at: like a regular indexed MagmaCollectionReader.
 	- Access is much faster.
