execution
start
	| res |
	"Okay move this to a work queue proof-of-concept single db lookup"
	database connectOrFail: [
		^systemFailure value: 'Can not connect to MySQL'].
	res := database queryKiBySubscriber: imsi.
	res isEmpty
		ifTrue: [self subscriberNotFound]
		ifFalse: [self subscriberFound: res first ].