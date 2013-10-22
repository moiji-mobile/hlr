interrogationPackage
sendRoutingInfoV2: anInvocation
	<consumer: 'MSC'>
	<consumer: 'gsmSCF'>
	<package: 'interrogationPackage-v2'>

	| msisdn |
	msisdn := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument msisdn) allButFirst.

	HLRSendRoutingInfoOperationV2 new
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		msisdn: msisdn;
		execute
		