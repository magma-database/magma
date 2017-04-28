private
generatePreNotification
	generator label: #preNotify.
	generator pushReceiver.
	generator send: #writeBarrier.
	generator pushReceiver.
	generator send: #aboutToModify: