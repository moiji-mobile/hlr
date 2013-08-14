infoRetrievalPackage
sendAuthenticationInfoV2: aDialogue request: anInvoke
	<consumer: 'VLR'>
	<consumer: 'HLR'>
	<package: 'infoRetrievalPackage-v2'>
	| imsi  |

	imsi := GSMNumberDigits decodeFrom: anInvoke components first imsi.
	(HLRSendAuthenticationInfoOperation for: imsi)
		formatResponse: [:list | list];
		database: database;
		dialogue: aDialogue;
		execute.
	