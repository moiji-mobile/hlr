functionalSsPackage
interrogateSS: anInvocation
	<consumer: 'VLR'>
	<package: 'functionalSsPackage-v1'>
	<package: 'functionalSsPackage-v2'>

	| gt |
	gt := self extractGlobalTitleOrAbort.

	(HLRInterrogateSSOperation for: gt address)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.