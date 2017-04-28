as yet unclassified
setUpListener
	"The purpose of this is to force aMagmaCollectionReader to nil-out its segments whenever any object is added or removed to the receiver, so that we can enjoy the side-effect of any objects added since then, merged back in.
	However, MagmaSet and MagmaDictionary don't need the local changes merged, because they are only accessed one object at a time; (e.g., #includes: or #at:ifAbsent:) direct.  They need to be fast and this helps."