private
allSelectorsDo: aBlock
	((self targetClass withAllSuperclasses copyWithout: Object) copyWithout: ProtoObject) do:
		[:cls |
		cls selectors do: aBlock]