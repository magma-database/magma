private
detach
	"Delete the node at curr from the list, and return the extracted node."
	| detached |
	prev next: next.
	detached := curr.
	curr := next.
	next := curr ifNotNil: [ curr next ].
	^ detached