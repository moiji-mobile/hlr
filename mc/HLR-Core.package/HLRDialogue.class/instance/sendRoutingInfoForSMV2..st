shortMsgGatewayPackage
sendRoutingInfoForSMV2: anInvocation
	<consumer: 'GMSC'>
	<package: 'shortMsgGatewayPackage-v2'>

	| msisdn smscAddr |
	msisdn := anInvocation argument msisdn fromE164.
	smscAddr := anInvocation argument serviceCentreAddress fromE164.
	hlr cdrClient sendRoutingInfo: msisdn smscAddr: smscAddr dialogue: self.

	HLRSendRoutingInfoForSMOperationV2 new
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		msisdn: msisdn;
		smscAddr: smscAddr;
		highPriority: anInvocation argument sm_RP_PRI;
		execute