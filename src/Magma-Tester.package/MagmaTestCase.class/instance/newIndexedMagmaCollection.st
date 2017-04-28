test non-persistent integration
newIndexedMagmaCollection

	| mc |
	mc := MagmaCollection new
		addIndex: (MaKeywordIndex attribute: #key) ;
		yourself.
	{ 'alpha beta'.
	'charlie denise'.
	'edward frank'.
	'tom dick harry'.
	'jack karen'.
	'larry greg'.
	'nancy ozzie'.
	'peter queso'.
	'randy steve'.
	'tina uma'.
	'vivian wilbur'.
	'xavier yo-yo-ma'.
	'zebra zzzzzzz' } do: [ : each | mc add: each substrings -> Object new ].
	^ mc