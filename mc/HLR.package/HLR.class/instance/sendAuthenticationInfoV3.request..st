infoRetrievalPackage
sendAuthenticationInfoV3: aDialogue request: anInvoke
	<consumer: 'VLR'>
	<consumer: 'HLR'>
	<package: 'infoRetrievalPackage-v3'>

	| imsi vectors |
	imsi := GSMNumberDigits decodeFrom: anInvoke components first imsi.
	vectors := anInvoke components first numberOfRequestedVectors.
	
	(HLRSendAuthenticationInfoOperation for: imsi)
		vectors: vectors;
		formatResponse: [:list | ASN1Array new add: list; yourself];
		database: database;
		dialogue: aDialogue;
		execute.