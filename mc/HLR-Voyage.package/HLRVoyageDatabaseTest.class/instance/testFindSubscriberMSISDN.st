as yet unclassified
testFindSubscriberMSISDN
	| sub |

	dataBase newQuery
		msisdn: Subscriber dummySubscriber msisdn;
		onSuccess: [:subscriber |
			sub := subscriber];
		start.

	self assert: sub imsi = Subscriber dummySubscriber imsi.
	self assert: sub msisdn = Subscriber dummySubscriber msisdn.