functionalSsPackage
deactivateSS: anInvocation
	<consumer: 'VLR'>
	<package: 'functionalSsPackage-v1'>
	<package: 'functionalSsPackage-v2'>

	| imsi |
	imsi := self extractIMSIOrAbort.
	logger logDebug: 'deactivateSS' with: { 'imsi' -> imsi }.
	imsi ifNil: [^self].

	(HLRDeactivateSSOperation for: imsi)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.