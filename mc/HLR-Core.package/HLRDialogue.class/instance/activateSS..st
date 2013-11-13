functionalSsPackage
activateSS: anInvocation
	<consumer: 'VLR'>
	<package: 'functionalSsPackage-v1'>
	<package: 'functionalSsPackage-v2'>

	| gt |

	gt := self extractGlobalTitleOrAbort.

	(HLRActivateSSOperation for: gt address)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.