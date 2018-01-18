linux-scripts
run
	"deamontools run script."
	^ 'spur -vm display=none server-spur.image run.st `cat port`' ->
	[ Smalltalk run:
			[ : portString |
			Smalltalk mitigateIfHeadless.
			Preferences enable: #serverMode.
			(MaNetworkRequestServer new
				console: MaRequestServerConsole new ;
				processOn: portString asInteger ;
				yourself) explore ] ]