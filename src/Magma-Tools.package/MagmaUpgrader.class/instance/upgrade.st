upgrade
upgrade
	[ [ self
		 verifyRunningLegacyVersion ;
		 warn ;
		 prepareModel ;
		 verifyCanUpgrade ;
		 upgradeBuffers ;
		 setVersion.
		 MagmaNotification signal: 'Upgrade complete.' ] ensure: [ self close ] ]
		on: MaNotification
		do:
			[ : noti | Transcript
				 cr ;
				 show: noti messageText.
			noti resume ]