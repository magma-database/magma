private
commitAnother
	"Submit another entry to the collection."
	collection add: self newEntry.
	session commitAndBegin