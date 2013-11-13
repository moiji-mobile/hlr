functionalSsPackage
activateSS: anInvocation
	<consumer: 'VLR'>
	<package: 'functionalSsPackage-v1'>
	<package: 'functionalSsPackage-v2'>

	| address gt |

	"In all wisdom we need to extract the "
	address := self container transaction address.
	gt := address parseGlobalTitle.
	
	"Abort if there is no GT"
	gt ifNil: [^self requestTcUAbort: (self uAbortCause: 0)].

	"Abort if it is not a IMSI"
	gt nature = SCCPGlobalTitle naiInternationalNumber
		ifFalse: [^self requestTcUAbort: (self uAbortCause: 0)].
	gt plan = SCCPGlobalTitle npLand
		ifFalse: [^self requestTcUAbort: (self uAbortCause: 0)].

	(HLRActivateSSOperation for: gt address)
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.