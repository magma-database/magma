private
trunk: aMaQueryTrunk 
	trunk := aMaQueryTrunk.
	"Share aMaQueryTrunk among all my segments."
	segment ifNotNil: [ segment trunk: aMaQueryTrunk ]