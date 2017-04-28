test querys - persistent result sets
createTransientResultSetAndVerify
	| sourceMc firstReader firstMc newReader secondReader |
	clientSession abort.
	sourceMc := clientSession root at: 'testPersistentResultSet-originalCollection'.

	"Note this is the non-blocking where.."
	firstReader := sourceMc 
		where: 
			[ : rdr | 
			rdr 
				read: #first
				from: 41
				to: 70 ]
		distinct: true
		sortBy: #first
		descending: false.

	"And, immediately, begin a (blocking) query where it creates, yet, another new non-persistent subcollection off the first non-persistent collection!"
	secondReader := firstReader 
		where: 
			[ : rdr | 
			rdr 
				read: #first
				from: 1
				to: 50 ]
		distinct: true
		sortedBy: #first
		descending: true.
	self assert: secondReader size = 10.
	self assert: secondReader collection size = 10.
	self assert: secondReader first = {  50  }.
	self assert: secondReader last = {  41  }.
	self deny: (clientSession isPersistent: secondReader).

	"Do some queries against the first reader."
	firstMc := firstReader collection.
	self assert: firstReader size = 30.
	self assert: firstMc ~~ sourceMc.
	self assert: firstMc size = 30.

	"an additional where query (which won't create a new underlying collection) against the first non-persistent collection."
	newReader := firstReader where: 
		[ : rdr | 
		rdr 
			read: #first
			from: 45
			to: 54 ].
	self assert: secondReader collection ~~ newReader collection.
	self assert: newReader size = 10.
	self assert: newReader first = {  45  }.
	self assert: newReader last = {  54  }.

	"Now persist the second result-set so client1 can do some assertions."
	clientSession commit: 
		[ clientSession root 
			at: 'testPersistentResultSet-secondReader'
			put: secondReader ].

	self assert: (clientSession isPersistent: secondReader)