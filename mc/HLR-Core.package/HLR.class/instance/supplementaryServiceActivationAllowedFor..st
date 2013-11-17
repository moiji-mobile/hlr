supplementary-services
supplementaryServiceActivationAllowedFor: aSSCode
	^{SSData callWaiting. SSData callForwardingUnconditional.
	   SSData barrAllOutgoingCalls. SSData barrIncomingCallRoam} includes: aSSCode