private
close

	repositoryController ifNotNil:
		[ repositoryController requestCritical: [ repositoryController close ] ]