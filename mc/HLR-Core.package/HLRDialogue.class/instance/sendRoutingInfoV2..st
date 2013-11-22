interrogationPackage
sendRoutingInfoV2: anInvocation
	<consumer: 'MSC'>
	<consumer: 'gsmSCF'>
	<package: 'interrogationPackage-v2'>

	| msisdn cdr |
	msisdn := anInvocation argument msisdn fromE164.
	cdr:= hlr cdrClient sendRoutingInfo: msisdn crn: nil dialogue: self.

	HLRSendRoutingInfoOperationV2 new
		originatingCallDataRecord: cdr;
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		msisdn: msisdn;
		execute
		