commenting
whyNoHash

	"Because we don't want to allow the receiver to ever be added to a hashed
	collection.  We want it to mutate and then be added, otherwise we'd have to
	know which hashed collections to rehash once the receiver was mutated."
