imsiRetrievalPackage
sendIMSI: anInvocation
	<consumer: 'VLR'>
	<package: 'imsiRetrievalPackage-v2'>
	| msisdn |

	msisdn := anInvocation argument fromE164.
	HLRSendIMSIOperation new
		hlr: hlr;
		msisdn: msisdn;
		dialogue: self;
		invocation: anInvocation;
		execute.