building
recordPotentialKeyChanges

	potentialKeysChange keysAndValuesDo:
		[ :eachObject :eachKeys |
			eachKeys valuesDo: 
				[ :eachHashes |
					eachHashes do: 
						[ :eachCio | "#( changes index, oldHash )"
							self
								recordPotentialKeyChangesFrom: eachCio last
								of: eachObject
								index: eachCio second
								in: eachCio first ] ] ]
