functionalSsPackage
registerSS: anInvocation
	<consumer: 'VLR'>
	<package: 'functionalSsPackage-v1'>
	<package: 'functionalSsPackage-v2'>

	| forwardedToNumber gt |
	"TODO: check if the number is international?!"
	gt := self extractGlobalTitleOrAbort.
	forwardedToNumber := anInvocation argument forwardedToNumber fromE164.

	(HLRRegisterSSOperation for: gt address)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		forwardedToNumber: forwardedToNumber;
		execute.