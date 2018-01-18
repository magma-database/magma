ide support
explorerContents
	| proxy |
	proxy := self printString.
	^ Array with:
		(ObjectExplorerWrapper
			with: self realObjectIfMutatingProxy
			name: proxy asString
			model: self realObjectIfMutatingProxy)