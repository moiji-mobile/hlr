infoRetrievalPackage
sendAuthenticationInfoV2: anInvocation
	<consumer: 'VLR'>
	<consumer: 'HLR'>
	<package: 'infoRetrievalPackage-v2'>
	| imsi  |

	imsi := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument).
	(HLRSendAuthenticationInfoOperation for: imsi)
		formatResponse: [:list | list];
		database: hlr database;
		dialogue: self;
		invocation: anInvocation;
		execute.
	