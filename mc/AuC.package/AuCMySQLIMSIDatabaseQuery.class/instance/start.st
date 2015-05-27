execution
start
	| res |
	"Okay move this to a work queue proof-of-concept single db lookup"
	res := database queryKiBySubscriber: imsi.
	res isEmpty
		ifTrue: [self subscriberNotFound]
		ifFalse: [self subscriberFound: res first ].