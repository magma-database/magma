creation
host: hostName port: anInteger 
	"Connect to a Magma server running on host named hostName, listening on port anInteger."
	^ self link: 
		((MaNetworkServerLink 
			host: hostName
			port: anInteger)
			protocol: self protocol ;
			yourself)