accessing
pageSize: anInteger 
	"Tell the receiver to retrieve anInteger number of elements at a time when 'scrolling' to a new part of the collection via at:."
	pageSize := anInteger.
	"We must refresh because my segments are laid out by my page-size and is also how my changes are merged."
	self refresh