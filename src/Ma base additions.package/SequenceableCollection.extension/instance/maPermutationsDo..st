*ma base additions
maPermutationsDo: aBlock 
	"I am a collection of other SequenceableCollections.  For each combination of elements in my element-Collections, value aBlock with the arguments Array of each combination of elements."
	| numberOfCombinations args valueAtBlock permutationsSpec |
	permutationsSpec := self select: [ : each | each notEmpty ].
	permutationsSpec ifEmpty: [ ^ self ].
	numberOfCombinations := permutationsSpec 
		inject: 1
		into: [ : prod : each | each size * prod ].
	args := Array new: permutationsSpec size.
	"Eliminate empty Array specifications, rather than complicate enumeration logic, below."
	valueAtBlock := 
	[ : elementIndex | 
	1 
		to: permutationsSpec size
		do: 
			[ : innerIndex | 
			| eachInnerArray radix |
			eachInnerArray := permutationsSpec at: innerIndex.
			radix := 1.
			1 
				to: innerIndex - 1
				do: [ : eachOrder | radix := radix * (permutationsSpec at: eachOrder) size ].
			args 
				at: innerIndex
				put: (eachInnerArray at: elementIndex // radix \\ eachInnerArray size + 1) ].
	aBlock value: args ].
	"With this formula, the last is the first, the first is the second."
	valueAtBlock value: numberOfCombinations.
	1 
		to: numberOfCombinations - 1
		do: valueAtBlock