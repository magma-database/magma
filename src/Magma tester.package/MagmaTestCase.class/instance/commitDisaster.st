test rollback recovery
commitDisaster
	"simulate an outage at the worst-possible time; after a commit which includes added and removed keys of an existing MagmaCollection (with index) and MagmaArray, some, new objects, a new class-def so it changes that part of its definition too, and a new MagmaArray (to test it removes files).  Just after has written the applied the commit to all the various files, it then exits the image without saving and without having written the end-apply tag record.  This will exercise all file types."
	| existingCollection reader newStuff existingArray |
	clientSession begin.
	existingCollection := clientSession root at: 'existing-collection for commitDisaster'.
	reader := existingCollection where: 
		[ : rdr | 
		rdr 
			read: #key
			from: 'x'
			to: 'z' ].
	self should: [ reader size > 1	"let's ensure at least a couple of removes to test" ].
	"remove a bunch.."
	reader asOrderedCollection do: [ : each | existingCollection remove: each ].
	"now add a bunch of new stuff."
	Number withAllSubclassesDo: 
		[ : each | 
		existingCollection add: each maCommentKeywords -> each name ].
	"Update the MagmaArray, extending its length.."
	existingArray := clientSession root at: 'existing-MagmaArray for commitDisaster'.
	50 
		to: 150
		do: 
			[ : each | 
			existingArray 
				at: each
				put: '#' , each printString ].
	"Create some new objects."
	newStuff := OrderedCollection new.
	newStuff
		add: MagmaArray new ;
		add: ((1 to: 100) collect: 
				[ : each | 
				"at the time this test runs, this should be a new class too."
				Object new ]).
	"Update some old objects."
	(clientSession root at: 'existing-objects for commitDisaster') do: 
		[ : eachAssociation | 
		| temp |
		temp := eachAssociation key.
		eachAssociation key: eachAssociation value.
		eachAssociation value: temp ].
	(clientSession root at: 'object to grow for commitDisaster') addAll: (3 to: 10).
	"Now do the fatal commit.."
	clientSession root 
		at: 'this key should NOT exist!'
		put: newStuff.
	clientSession commit