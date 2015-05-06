mwdgMntPackage
readyForSMV3: anInvocation
	<consumer: 'GGSN'>
	<consumer: 'VLR'>
	<package: 'mwdMngtPackage-v3'>

	| imsi |
	imsi := anInvocation argument imsi fromTBCD.
	logger logDebug: 'readyForSMv3' with: { 'imsi' -> imsi }.
	(HLRReadyForSMV3Operation for: imsi)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		msPresent: (anInvocation argument alertReason value = 'ms-Present');
		memoryAvailable: (anInvocation argument alertReason value = 'memoryAvailable');
		execute.