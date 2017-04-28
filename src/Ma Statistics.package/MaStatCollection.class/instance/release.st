initialize-release
release
	"release each of my historys so their timer processes will be cleaned up."
	self historysDo: [ : each | each release ]