execution
onSubscriberFound: aSubscriber
	"This whole specification reads like crap. First we assume that everything
	only takes place on the GSM side of things (no GPRS). Then for V2 more
	care needs to be taken.."
	subscriber := aSubscriber.

	"TODO: there are multiple reasons for callBarred. Wait until it matters."
	(dialogue mobileTerminatedSMSAllowedFor: aSubscriber invocation: invocation) ifFalse: [
		^self endWithErrorNamed: 'callBarred' ].

	"Sheet 2/5"
	aSubscriber hasVLR ifFalse: [
		aSubscriber mobileStationNotPresent.
		^self handleNotReachableLowPriority.
	].

	aSubscriber isMobileStationNotReachable
		ifTrue: [self handleNotReachable]
		ifFalse: [self provideRoutingInformation].