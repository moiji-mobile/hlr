interrogationPackage
sendRoutingInfoV3: anInvocation
	<consumer: 'MSC'>
	<consumer: 'gsmSCF'>
	<package: 'interrogationPackage-v3'>

	| msisdn crn |
	msisdn := anInvocation argument msisdn fromE164.
	crn := anInvocation argument callReferenceNumber.
	hlr cdrClient sendRoutingInfo: msisdn crn: crn dialogue: self.

	HLRSendRoutingInfoOperationV3 new
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		msisdn: msisdn;
		callReferenceNumber: crn;
		execute