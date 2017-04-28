private
possiblyNewerVersionsOfAnyOf: versionNames 
	"Answer a collection of MCVersionNames which might be newer versions of the versions identified by versionNames."
	^ versionNames
		inject: OrderedCollection new
		into:
			[ : coll : eachVersionName | | eachPackageName eachVersions |
			eachPackageName := eachVersionName packageName.
			(eachVersions := self mcModel versionsForPackageNamed: eachPackageName).
			(eachVersions size - 25 max: 1) to: eachVersions size do:
				[ : n | |eachInSelf|
				eachInSelf:=(eachVersions at: n) versionName.
				(eachInSelf versionNumber > eachVersionName versionNumber or:
					[ eachInSelf versionNumber = eachVersionName versionNumber and: [ eachInSelf author ~= eachVersionName author ] ]) ifTrue: [ coll add: eachInSelf ] ].
			coll ]