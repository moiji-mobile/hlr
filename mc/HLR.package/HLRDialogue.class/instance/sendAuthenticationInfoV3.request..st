infoRetrievalPackage
sendAuthenticationInfoV3: aDialogue request: anInvocation
	<consumer: 'VLR'>
	<consumer: 'HLR'>
	<package: 'infoRetrievalPackage-v3'>

	| imsi vectors |
	imsi := GSMNumberDigits decodeFrom: anInvocation components first imsi.
	vectors := anInvocation components first numberOfRequestedVectors.
	
	(HLRSendAuthenticationInfoOperation for: imsi)
		vectors: vectors;
		formatResponse: [:list | ASN1Array new add: list; yourself];
		database: database;
		invocation: anInvocation;
		execute.