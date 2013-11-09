shortMsgGatewayPackage
sendRoutingInfoForSMV2: anInvocation
	<consumer: 'GMSC'>
	<package: 'shortMsgGatewayPackage-v2'>

	| msisdn smscAddr |
	msisdn := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument msisdn) allButFirst.
	smscAddr := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument serviceCentreAddress) allButFirst.

	HLRSendRoutingInfoForSMOperationV2 new
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		msisdn: msisdn;
		smscAddr: smscAddr;
		highPriority: anInvocation argument sm_RP_PRI;
		execute