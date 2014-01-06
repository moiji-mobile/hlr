interrogationPackage
sendRoutingInfoV3: anInvocation
	<consumer: 'MSC'>
	<consumer: 'gsmSCF'>
	<package: 'interrogationPackage-v3'>
	
	"Routing is a bit messed up and it is easier to code the if here than trying
	to handle this from with-in the HLRSendRoutingInfoOperation"

	| suppressTCSI |

	"Does this even support the required phase"
	(self invocationSupportsPhaseTwo: anInvocation)
		ifFalse: [^super sendRoutingInfoV3: anInvocation].

	"Does the MSC ask to suppress T-CSI handling and asks for a MSRN?"
	suppressTCSI := anInvocation argument camelInfo suppress_T_CSI.
	suppressTCSI ifNotNil: [^super sendRoutingInfoV3: anInvocation].

	self camelSendRoutingInfoV3: anInvocation.