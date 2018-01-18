event handling
mouseUp: aMouseMoveEvent 
	self
		 hideCrosshair ;
		 hideLabels.
	self selectedExtras ifNotEmpty:
		[ : extras | self
			triggerEvent: #pointsSelected
			with: extras ].
	self
		 deselectAll ;
		 metaElementsChanged