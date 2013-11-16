shortMsgGatewayPackage
sendRoutingInfoForSMV3: anInvocation
	<consumer: 'GMSC'>
	<package: 'shortMsgGatewayPackage-v3'>

	| msisdn smscAddr |
	msisdn := anInvocation argument msisdn fromE164.
	smscAddr := anInvocation argument serviceCentreAddress fromE164.

	HLRSendRoutingInfoForSMOperationV3 new
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		msisdn: msisdn;
		smscAddr: smscAddr;
		highPriority: anInvocation argument sm_RP_PRI;
		execute