interrogationPackage
sendRoutingInfoV2: anInvocation
	<consumer: 'MSC'>
	<consumer: 'gsmSCF'>
	<package: 'interrogationPackage-v2'>

	| msisdn |
	msisdn := anInvocation argument msisdn fromE164.
	hlr cdrClient sendRoutingInfo: msisdn crn: nil dialogue: self.

	HLRSendRoutingInfoOperationV2 new
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		msisdn: msisdn;
		execute
		