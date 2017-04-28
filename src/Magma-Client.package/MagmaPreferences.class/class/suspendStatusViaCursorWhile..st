mouse cursor
suspendStatusViaCursorWhile: aBlock
	| priorSetting |
	priorSetting := self showStatusViaCursor.
	self showStatusViaCursor: false.
	aBlock ensure: [ self showStatusViaCursor: priorSetting ]