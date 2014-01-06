execution
onSubscriberFound: aSubscriber
	"This whole specification reads like crap. First we assume that everything
	only takes place on the GSM side of things (no GPRS). Then for V2 more
	care needs to be taken.."
	subscriber := aSubscriber.

	(dialogue mobileTerminatedSMSAllowedFor: aSubscriber invocation: invocation) ifFalse: [
		invocation returnError: 'callBarred' with: nil.
		^dialogue requestTcEnd: false].

	aSubscriber isMobileStationNotReachable
		ifTrue: [self handleNotReachable]
		ifFalse: [self provideRoutingInformation].