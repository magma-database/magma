players
pushClass: aClass 
	self orchestra players do:
		[ : each | each pushClass: aClass ]