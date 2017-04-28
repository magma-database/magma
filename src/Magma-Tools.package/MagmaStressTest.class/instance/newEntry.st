private
newEntry
	^ Association 
		key: self incrementCounter
		value: {  uuid. (self newObjectArray)  }