functionalSsPackage
registerSS: anInvocation
	<consumer: 'VLR'>
	<package: 'functionalSsPackage-v1'>
	<package: 'functionalSsPackage-v2'>

	| forwardedToNumber imsi |
	"TODO: check if the number is international?!"
	imsi := self extractIMSIOrAbort.
	imsi ifNil: [^self].

	forwardedToNumber := anInvocation argument forwardedToNumber fromE164.

	(HLRRegisterSSOperation for: imsi)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		forwardedToNumber: forwardedToNumber;
		execute.