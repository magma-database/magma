initialize-release
releaseSystemChangeNotifications
	guard critical: 
		[ SystemChangeNotifier uniqueInstance
			noMoreNotificationsFor: self ;
			noMoreNotificationsFor: serializer classIdManager ]