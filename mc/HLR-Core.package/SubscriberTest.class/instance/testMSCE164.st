tests-access
testMSCE164
	| subscriber |
	subscriber := Subscriber dummySubscriber.
	subscriber mscNumber: '1234'.
	self assert: subscriber mscNumber equals: '1234'.
	self assert: subscriber mscNumberAsE164 class equals: ByteArray.
	self assert: subscriber mscNumberAsE164 fromE164 equals: '1234'.