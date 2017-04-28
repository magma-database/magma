test forwarding proxys
testForwardingProxy
	self
		createPeer ;
		remotePerform: #startPeer in: 'server' ;
		remotePerform: #commitForwardingProxy in: 'client1';
		remotePerform: #verifySharedPageCache in: 'client2' 

"Don't stop the peer because a later test could cause an activation of the FP that references the object here, which would lead to a ConnectionTimedOut."

";
		remotePerform: #stopPeer in: 'server'"