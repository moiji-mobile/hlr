as yet unclassified
setUp
	| subscriber |
	subscriber := SubscriberVoyage dummySubscriber.
	dataBase := HLRDatabaseVoyage createTestDefault.
	dataBase insert: subscriber.