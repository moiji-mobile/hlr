interrogationPackage
sendRoutingInfoV3: anInvocation
	<consumer: 'MSC'>
	<consumer: 'gsmSCF'>
	<package: 'interrogationPackage-v3'>

	| msisdn |
	msisdn := anInvocation argument msisdn fromE164.

	HLRSendRoutingInfoOperationV3 new
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		msisdn: msisdn;
		execute