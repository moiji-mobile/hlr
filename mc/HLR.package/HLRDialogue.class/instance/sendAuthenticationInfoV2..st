infoRetrievalPackage
sendAuthenticationInfoV2: anInvocation
	<consumer: 'VLR'>
	<consumer: 'HLR'>
	<package: 'infoRetrievalPackage-v2'>
	| imsi  |

	imsi := GSMNumberDigits decodeFrom: anInvocation components first imsi.
	(HLRSendAuthenticationInfoOperation for: imsi)
		formatResponse: [:list | list];
		database: database;
		invocation: anInvocation;
		execute.
	