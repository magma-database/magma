private
cleanUpWriteBarrier
	self abort.
	transaction
		 writeBarrierStatusChangedFor: self ;
		 cleanUpWriteBarrier