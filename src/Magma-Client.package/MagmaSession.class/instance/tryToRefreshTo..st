private
tryToRefreshTo: repositoryCommitNumber 
	"If the server has the available commit-log records, answer the next few hundred of them and update this session.  If not, signal a MagmaUnavailableCommitRecord."
	| commitLogSerializer lastPosition cn |
	commitLogSerializer := self class newCommitLogSerializer.
	lastPosition := -1.
	
	[ cn := self commitNumber.
	cn > lastPosition and: [ cn < repositoryCommitNumber ] ] whileTrue: 
		[ lastPosition := cn.
		self advanceUsing: commitLogSerializer ]