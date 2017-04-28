*Magma seaside
visitMagmaLocationAttribute: anAttribute with: html

	| location |
	location := configuration valueForAttribute: anAttribute.

	html select
		list: anAttribute options;
		selected: location class;
		labels: [ :ea | ea name ];
		callback: 
			[ :item |
			(configuration valueAt: #location) class = item
				ifFalse: [ configuration takeValue: item default forAttribute: anAttribute ] ];
		beSubmitOnChange.

	self renderMagmaLocationAttribute: anAttribute on: html.