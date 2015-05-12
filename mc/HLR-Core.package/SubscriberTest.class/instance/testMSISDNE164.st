tests-access
testMSISDNE164
	| subscriber |
	subscriber := Subscriber dummySubscriber.
	subscriber msisdn: '1234'.
	self assert: subscriber msisdn equals: '1234'.
	self assert: subscriber msisdn toE164 class equals: ByteArray.
	self assert: subscriber msisdn toE164 fromE164 equals: '1234'.