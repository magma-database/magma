private
colorFor: statAttributeSelector
self maMarked: 'delete'.
	statAttributeSelector = #min ifTrue: [ ^ Color blue muchDarker ].
	statAttributeSelector = #max ifTrue: [ ^ Color blue muchLighter ].
	statAttributeSelector = #mean ifTrue: [ ^ Color green ].
	statAttributeSelector = #count ifTrue: [ ^ Color yellow ].
	statAttributeSelector = #sum ifTrue: [ ^ Color lightGray ].
	^ Color blue