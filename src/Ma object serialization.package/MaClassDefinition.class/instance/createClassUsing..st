actions
createClassUsing: aMaObjectSerializer
	| superClass |
	superClass := self superclassDefinition ensureClassUsing: aMaObjectSerializer.
	^ SystemChangeNotifier uniqueInstance doSilently:
		[ ((ClassBuilder new)
			name: self className
			inEnvironment: superClass environment 
			subclassOf: superClass
			type: type 
			instanceVariableNames: self instanceVariablesString 
			classVariableNames: self classVariablesString 
			poolDictionaries: self sharedPoolsString
			category: category)
			
			ifNotNilDo:
				[ : class |
				aMaObjectSerializer classIdManager
					idOfClass: class
					is: self id.
				class class instanceVariableNames: self classInstanceVariablesString.
				class hasComment
					ifTrue: 
						[ class 
							classComment: comment 
							stamp: commentStamp ].
				aMaObjectSerializer classIdManager refreshInImageDefinition: class.
				class ] ]