initialize-release
defaultAction
	self resume:
		(FillInTheBlank 
			request: self messageText
			initialAnswer: self initialAnswer)