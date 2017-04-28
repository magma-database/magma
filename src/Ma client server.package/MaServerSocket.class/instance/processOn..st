start/stop
processOn: portNumber 
	"By using this method, I will call my servers #processRequestByteArray:.  If you don't want to have a MaServer class, use listenOn:answer:."
	port := portNumber.
	self listen