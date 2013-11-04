interrogationPackage
sendRoutingInfoV3: anInvocation
	<consumer: 'MSC'>
	<consumer: 'gsmSCF'>
	<package: 'interrogationPackage-v3'>

	| msisdn |
	msisdn := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument msisdn) allButFirst.

	HLRSendRoutingInfoOperationV3 new
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		msisdn: msisdn;
		execute