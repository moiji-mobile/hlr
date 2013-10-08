infoRetrievalPackage
sendAuthenticationInfoV2: anInvocation
	<consumer: 'VLR'>
	<consumer: 'HLR'>
	<package: 'infoRetrievalPackage-v2'>
	| imsi  |

	self halt.
	imsi := GSMNumberDigits decodeFrom: (ByteArray readHexFrom: anInvocation argument).
	(HLRSendAuthenticationInfoOperation for: imsi)
		database: hlr database;
		dialogue: self;
		invocation: anInvocation;
		execute.
	