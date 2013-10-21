as yet unclassified
setUp
	| db |
	db := HLRInImageDatabase new.
	subscriber := Subscriber testSubscriber.
	db insert: subscriber.
	testHlr := HLR new
			database: db;
			yourself.

	testEndPoint := TCAPTestServiceEndPoint new.
	hlrEndPoint := TCAPTestServiceEndPoint newHLR.
	hlrEndPoint transactionCoordinator: TCAPTestTransactionCoordinator new.
	hlrEndPoint factory hlr: testHlr.

	testEndPoint connectTo: hlrEndPoint.
	hlrEndPoint connectTo: testEndPoint.