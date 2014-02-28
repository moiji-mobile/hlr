infoRetrievalPackage
sendAuthenticationInfoV3: anInvocation
	<consumer: 'VLR'>
	<consumer: 'HLR'>
	<package: 'infoRetrievalPackage-v3'>

	| imsi vectors isSGSN |
	imsi := anInvocation argument imsi fromTBCD.
	vectors := anInvocation argument numberOfRequestedVectors.
	isSGSN := anInvocation argument requestingNodeType value = 'sgsn'.
	vectors ifNil: [vectors := 4].

	"German SGSNs apparently do not like to have a GSM triplet as a result.
	As we have no notion of SIM vs. USIM right now just abort the V3 context
	and hope that a V2 one is opened."
	isSGSN ifTrue: [
		applicationContextName := '0.4.0.0.1.0.14.2'.
		applicationContext := (self tcapModel bindingNamed: 'infoRetrievalContext-v2') value.
		^self requestTcUAbort: TCAPDialogueResponse serviceUser applicationContextNameNotSupported rejectPermanent].
	
	(HLRSendAuthenticationInfoOperationV3 for: imsi)
		vectors: vectors;
		hlr: hlr;
		dialogue: self;
		invocation: anInvocation;
		execute.