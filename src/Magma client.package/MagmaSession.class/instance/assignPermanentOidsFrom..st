private
assignPermanentOidsFrom: permanentOidsDictionary

	permanentOidsDictionary ifNil: [ ^ self ].
	permanentOidsDictionary keysAndValuesDo:
		[ : eachTempOid : eachPermanentOid |
		serializer
			objectWithOid: eachTempOid
			ifFound: 
				[ : persistentObject | 
				serializer
					oidOf: persistentObject
					is: eachPermanentOid.
				persistentObject maIsLargeCollection ifTrue: [ persistentObject setOid: eachPermanentOid ] ]
			ifAbsent: [ nil ] ]