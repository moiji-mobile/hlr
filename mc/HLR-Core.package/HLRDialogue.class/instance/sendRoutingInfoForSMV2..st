shortMsgGatewayPackage
sendRoutingInfoForSMV2: anInvocation
	<consumer: 'GMSC'>
	<package: 'shortMsgGatewayPackage-v2'>

	| msisdn |
	msisdn := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument msisdn) allButFirst.

	HLRSendRoutingInfoForSMOperationV2 new
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		msisdn: msisdn;
		execute