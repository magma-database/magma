*ma-core
maPermutationsWithIndexesDo: aBlock 
	"I am a collection of other SequenceableCollections.  For each combination of elements in my element-Collections, value aBlock with the arguments Array of each combination of elements."
	| numberOfCombinations args valueAtBlock permutationsSpec indexes |
	"Eliminate empty Array specifications, rather than complicate enumeration logic."
	permutationsSpec := self select: [ : each | each notEmpty ].
	permutationsSpec ifEmpty: [ ^ self ].
	numberOfCombinations := permutationsSpec maPermutationsSize.
	args := Array new: permutationsSpec size.
	indexes := Array new: permutationsSpec size.
	valueAtBlock := 
	[ : elementIndex | 
	1 
		to: permutationsSpec size
		do: 
			[ : innerIndex | | eachInnerArray innerArrayIndex radix |
			eachInnerArray := permutationsSpec at: innerIndex.
			radix := 1.
			1 
				to: innerIndex - 1
				do: [ : eachOrder | radix := radix * (permutationsSpec at: eachOrder) size ].
			innerArrayIndex := elementIndex // radix \\ eachInnerArray size + 1.
			indexes at: innerIndex put: innerArrayIndex.
			args 
				at: innerIndex
				put: (eachInnerArray at: innerArrayIndex) ].
	aBlock value: args value: indexes ].
	"With this formula, the last is the first, the first is the second."
	valueAtBlock value: numberOfCombinations.
	1 
		to: numberOfCombinations - 1
		do: valueAtBlock