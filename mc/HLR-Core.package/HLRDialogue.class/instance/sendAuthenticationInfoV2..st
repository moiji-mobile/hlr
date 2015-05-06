infoRetrievalPackage
sendAuthenticationInfoV2: anInvocation
	<consumer: 'VLR'>
	<consumer: 'HLR'>
	<package: 'infoRetrievalPackage-v2'>
	| imsi  |

	imsi := anInvocation argument fromTBCD.
	logger logDebug: 'sendAuthenticationInfoV2' with: { 'imsi' -> imsi }.
	(HLRSendAuthenticationInfoOperation for: imsi)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.
	