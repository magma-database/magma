linux-scripts
view
	"View the contents of Squeak's internal RFB server."
	^ 'xtightvncviewer ::"$[`cat port`+5900]"'
		-> [ ]