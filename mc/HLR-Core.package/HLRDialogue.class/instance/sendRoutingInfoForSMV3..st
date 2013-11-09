shortMsgGatewayPackage
sendRoutingInfoForSMV3: anInvocation
	<consumer: 'GMSC'>
	<package: 'shortMsgGatewayPackage-v3'>

	| msisdn smscAddr |
	msisdn := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument msisdn) allButFirst.
	smscAddr := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument serviceCentreAddress) allButFirst.

	HLRSendRoutingInfoForSMOperationV3 new
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		msisdn: msisdn;
		smscAddr: smscAddr;
		highPriority: anInvocation argument sm_RP_PRI;
		execute