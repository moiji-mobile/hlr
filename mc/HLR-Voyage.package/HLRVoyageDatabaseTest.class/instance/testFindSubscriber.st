as yet unclassified
testFindSubscriber
	| sub |

	dataBase newQuery
		imsi: SubscriberVoyage dummySubscriber imsi;
		onSuccess: [:subscriber |
			sub := subscriber];
		start.

	self assert: sub imsi = SubscriberVoyage dummySubscriber imsi.
	self assert: sub msisdn = SubscriberVoyage dummySubscriber msisdn.