mwdgMntPackage
readyForSMV2: anInvocation
	<consumer: 'GGSN'>
	<consumer: 'VLR'>
	<package: 'mwdMngtPackage-v2'>

	| imsi |
	imsi := anInvocation argument imsi fromTBCD.
	logger logDebug: 'readyForSMv2' with: { 'imsi' -> imsi }.
	(HLRReadyForSMV2Operation for: imsi)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		msPresent: (anInvocation argument alertReason value = 'ms-Present');
		memoryAvailable: (anInvocation argument alertReason value = 'memoryAvailable');
		execute.