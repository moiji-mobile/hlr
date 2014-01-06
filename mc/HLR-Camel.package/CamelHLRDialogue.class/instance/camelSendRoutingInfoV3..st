interrogationPackage
camelSendRoutingInfoV3: anInvocation
	"We attempt to provide an initial camel result"
	
	| msisdn crn cdr |
	msisdn := anInvocation argument msisdn fromE164.
	crn := anInvocation argument callReferenceNumber.
	cdr := hlr cdrClient sendRoutingInfo: msisdn crn: crn dialogue: self.

	HLRCamelSendRoutingInfoOperationV3 new
		originatingCallDataRecord: cdr;
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		msisdn: msisdn;
		callReferenceNumber: crn;
		execute