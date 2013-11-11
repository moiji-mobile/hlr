infoRetrievalPackage
sendAuthenticationInfoV3: anInvocation
	<consumer: 'VLR'>
	<consumer: 'HLR'>
	<package: 'infoRetrievalPackage-v3'>

	| imsi vectors |
	imsi := anInvocation argument imsi fromTBCD.
	vectors := anInvocation argument numberOfRequestedVectors.
	vectors ifNil: [vectors := 4].
	
	(HLRSendAuthenticationInfoOperationV3 for: imsi)
		vectors: vectors;
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.