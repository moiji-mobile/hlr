functionalSsPackage
registerSS: anInvocation
	<consumer: 'VLR'>
	<package: 'functionalSsPackage-v1'>
	<package: 'functionalSsPackage-v2'>

	| forwardedToNumber imsi |
	"TODO: check if the number is international?!"
	imsi := self extractIMSIOrAbort.
	logger logDebug: 'registerSS' with: { 'imsi' -> imsi }.
	imsi ifNil: [^self].

	forwardedToNumber := anInvocation argument forwardedToNumber.

	(HLRRegisterSSOperation for: imsi)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		forwardedToNumber: forwardedToNumber;
		execute.