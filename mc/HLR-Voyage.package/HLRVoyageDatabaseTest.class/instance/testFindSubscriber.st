as yet unclassified
testFindSubscriber
	| sub |

	dataBase newIMSIQuery
		imsi: Subscriber dummySubscriber imsi;
		onSuccess: [:subscriber |
			sub := subscriber];
		start.

	self assert: sub imsi = Subscriber dummySubscriber imsi.
	self assert: sub msisdn = Subscriber dummySubscriber msisdn.