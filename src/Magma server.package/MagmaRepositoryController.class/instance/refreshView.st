private
refreshView
	self session refresh.
	repository systemReadStrategy makeReadyForUseUsing: self session serializer classIdManager