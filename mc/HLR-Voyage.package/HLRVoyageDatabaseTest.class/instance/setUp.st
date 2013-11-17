as yet unclassified
setUp
	| subscriber |
	dataBase := HLRDatabaseVoyage createTestDefault.
	
	subscriber := Subscriber dummySubscriber.
	dataBase insert: subscriber.

	subscriber := CamelSubscriber dummySubscriber.
	subscriber
		imsi: '274080000003001';
		msisdn: '354385010000'.
	dataBase insert: subscriber.