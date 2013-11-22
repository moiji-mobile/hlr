interrogationPackage
sendRoutingInfoV3: anInvocation
	<consumer: 'MSC'>
	<consumer: 'gsmSCF'>
	<package: 'interrogationPackage-v3'>

	| msisdn crn cdr |
	msisdn := anInvocation argument msisdn fromE164.
	crn := anInvocation argument callReferenceNumber.
	cdr := hlr cdrClient sendRoutingInfo: msisdn crn: crn dialogue: self.

	HLRSendRoutingInfoOperationV3 new
		originatingCallDataRecord: cdr;
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		msisdn: msisdn;
		callReferenceNumber: crn;
		execute