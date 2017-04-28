initialize-release
initializeSystemChangeNotifications

	SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #class
		change: #Modified
		using: #handleClassModification:.
	SystemChangeNotifier uniqueInstance
		notify: serializer classIdManager
		ofSystemChangesOfItem: #class
		change: #Renamed
		using: #handleClassRename: