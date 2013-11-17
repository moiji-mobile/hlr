supplementary-services
supplementaryServiceDeactivationAllowedFor: aSSCode
	^{SSData callWaiting. SSData callForwardingUnconditional.
	   SSData barrAllOutgoingCalls. SSData barrIncomingCallRoam.
	   SSData allCallRestriction} includes: aSSCode