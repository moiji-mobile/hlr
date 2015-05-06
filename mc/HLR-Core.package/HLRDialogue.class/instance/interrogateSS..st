functionalSsPackage
interrogateSS: anInvocation
	<consumer: 'VLR'>
	<package: 'functionalSsPackage-v1'>
	<package: 'functionalSsPackage-v2'>

	| imsi |
	imsi := self extractIMSIOrAbort.
	logger logDebug: 'interrogateSS' with: { 'imsi' -> imsi }.
	imsi ifNil: [^self].

	(HLRInterrogateSSOperation for: imsi)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.