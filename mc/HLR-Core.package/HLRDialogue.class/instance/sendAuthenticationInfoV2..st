infoRetrievalPackage
sendAuthenticationInfoV2: anInvocation
	<consumer: 'VLR'>
	<consumer: 'HLR'>
	<package: 'infoRetrievalPackage-v2'>
	| imsi  |

	imsi := anInvocation argument fromTBCD.
	(HLRSendAuthenticationInfoOperation for: imsi)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.
	