debugging
debugProxiesWhile: aBlock 
	| priorSetting |
	priorSetting := DebugProxies.
	self debugProxies: true.
	aBlock ensure: [ self debugProxies: priorSetting ]