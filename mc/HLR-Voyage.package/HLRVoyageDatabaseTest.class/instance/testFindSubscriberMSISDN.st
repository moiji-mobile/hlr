as yet unclassified
testFindSubscriberMSISDN
	| sub |

	dataBase newQuery
		msisdn: SubscriberVoyage dummySubscriber msisdn;
		onSuccess: [:subscriber |
			sub := subscriber];
		start.

	self assert: sub imsi = SubscriberVoyage dummySubscriber imsi.
	self assert: sub msisdn = SubscriberVoyage dummySubscriber msisdn.