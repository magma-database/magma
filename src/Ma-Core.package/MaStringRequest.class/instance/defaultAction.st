initialize-release
defaultAction
	self resume:
		(UIManager default 
			request: self messageText
			initialAnswer: self initialAnswer)