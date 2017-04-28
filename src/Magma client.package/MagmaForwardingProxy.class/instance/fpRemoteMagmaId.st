private
fpRemoteMagmaId
	"Answers the MagmaId of the repository which my realObject belongs."
	"The only time my magmaId should be nil is if a non-persistent object is sent #asMagmaForwardingProxy."
	^ magmaId