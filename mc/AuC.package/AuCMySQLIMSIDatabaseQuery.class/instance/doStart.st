execution
doStart
	| res |
	database connectOrFail: [
		^systemFailure value: 'Can not connect to MySQL'].
	res := database queryKiBySubscriber: imsi.
	res isEmpty
		ifTrue: [self subscriberNotFound]
		ifFalse: [self subscriberFound: res first ].