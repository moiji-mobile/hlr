infoRetrievalPackage
sendAuthenticationInfoV3: anInvocation
	<consumer: 'VLR'>
	<consumer: 'HLR'>
	<package: 'infoRetrievalPackage-v3'>

	| imsi vectors |
	imsi := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument imsi).
	vectors := anInvocation argument numberOfRequestedVectors.
	
	(HLRSendAuthenticationInfoOperation for: imsi)
		vectors: vectors;
		formatResponse: [:list | ASN1Array new add: list; yourself];
		database: hlr database;
		invocation: anInvocation;
		execute.