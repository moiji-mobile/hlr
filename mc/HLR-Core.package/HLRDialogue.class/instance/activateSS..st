functionalSsPackage
activateSS: anInvocation
	<consumer: 'VLR'>
	<package: 'functionalSsPackage-v1'>
	<package: 'functionalSsPackage-v2'>

	| imsi |

	imsi := self extractIMSIOrAbort.
	logger logDebug: 'activateSS' with: { 'imsi' -> imsi }.
	imsi ifNil: [^self].

	(HLRActivateSSOperation for: imsi)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.