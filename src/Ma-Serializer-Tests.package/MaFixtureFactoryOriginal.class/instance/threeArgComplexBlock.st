private individual fixtures
threeArgComplexBlock

	^[ :path :parent :index |
		Transcript
			cr;
			tab: path size;
			nextPutAll: path last printString ]
