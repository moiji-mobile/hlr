supplementary-services
supplementaryServiceActivationAllowedFor: aSSCode
	^{SSData callWaiting. SSData callForwardingUnconditional.
	   SSData barrAllOutgoingCalls.} includes: aSSCode