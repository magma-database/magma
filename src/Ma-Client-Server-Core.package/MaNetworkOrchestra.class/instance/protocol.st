accessing
protocol
	"An array of the classes of objects that will be passed between conductor and players."
	^ protocol ifNil: [ { MaRemotePerformRequest } ]