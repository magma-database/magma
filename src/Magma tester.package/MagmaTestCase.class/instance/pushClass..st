loading code
pushClass: aClass

	self playersDo: [ :each | each name ~= 'server' ifTrue: [ each pushClass: aClass ] ]