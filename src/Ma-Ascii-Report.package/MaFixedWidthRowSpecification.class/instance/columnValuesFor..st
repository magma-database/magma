private
columnValuesFor: anObject 
	^ self columns collect: [ : eachColumn | eachColumn rawValue: anObject ]