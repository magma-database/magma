performance
readSetCountByClass
	"The number of objects in the readSet.  The caution
with caching too many objects is that it can cause the readSet to be large, which will affect the speed of commits.

There are several tools to deal with THAT:

	 - implement #isImmutableInMagma to return true.  Instances of that object will not be put into the readSet.
	 - Create a one-time ImmutabilityStrategy.  This is a more sophisticated way to describe immutability -- by using a Block.
	 - Turn on the WriteBarrier.  This is, by far, the most effective solution to the problem.  It's totally transparent and free."
	^ transaction readSetCountByClass