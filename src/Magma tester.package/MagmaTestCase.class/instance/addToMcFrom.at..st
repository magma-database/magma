test rollback recovery
addToMcFrom: aClass at: aString

	| mc |
	mc := clientSession root at: aString.
	aClass withAllSubclassesDo: [ : each | clientSession commit: [ mc add: each maCommentKeywords -> each name ] ]