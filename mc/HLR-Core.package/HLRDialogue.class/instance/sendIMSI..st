imsiRetrievalPackage
sendIMSI: anInvocation
	<consumer: 'VLR'>
	<package: 'imsiRetrievalPackage-v2'>
	| msisdn |

	msisdn := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument) allButFirst.
	HLRSendIMSIOperation new
		hlr: hlr;
		msisdn: msisdn;
		dialogue: self;
		invocation: anInvocation;
		execute.