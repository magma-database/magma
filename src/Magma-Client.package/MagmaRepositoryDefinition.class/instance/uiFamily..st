ui
uiFamily: aMauiFamily 
	"Argument says its a MauiFamily, but it could be any type of UI-family that responds to #merge: (which merges the panels of one family into the other)."
	self
		attributeNamed: #uiFamily
		put: aMauiFamily