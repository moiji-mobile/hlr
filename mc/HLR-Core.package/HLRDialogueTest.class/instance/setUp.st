as yet unclassified
setUp
	| db |
	db := HLRInImageDatabase new.
	db insert: Subscriber testSubscriber.
	testHlr := HLR new
			database: db;
			yourself.

	testEndPoint := TCAPTestServiceEndPoint new.
	hlrEndPoint := TCAPTestServiceEndPoint newHLR.
	hlrEndPoint transactionCoordinator: TCAPTestTransactionCoordinator new.
	hlrEndPoint factory hlr: testHlr.

	testEndPoint connectTo: hlrEndPoint.
	hlrEndPoint connectTo: testEndPoint.