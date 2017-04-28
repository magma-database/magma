*ma squeak domain
topMonticelloVersions
	"Answer the top versions of each package name.  I really should use Monticello repostories, but I don't have time to learn it right now."
	^ PackageInfo topMonticelloVersionsIn: (self fileNames select: 
			[ : each | 
			each 
				maEndsWith: '.mcz'
				caseSensitive: false ])