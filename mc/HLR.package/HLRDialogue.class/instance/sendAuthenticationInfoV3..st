infoRetrievalPackage
sendAuthenticationInfoV3: anInvocation
	<consumer: 'VLR'>
	<consumer: 'HLR'>
	<package: 'infoRetrievalPackage-v3'>

	| imsi vectors |
	imsi := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument imsi).
	vectors := anInvocation argument numberOfRequestedVectors.
	vectors ifNil: [vectors := 4].
	
	(HLRSendAuthenticationInfoOperationV3 for: imsi)
		vectors: vectors;
		database: hlr database;
		dialogue: self;
		invocation: anInvocation;
		execute.