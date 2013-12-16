as yet unclassified
setUp
	| db |
	db := HLRInImageDatabase new.
	subscriber := Subscriber testSubscriber.
	db insert: subscriber.
	testHlr := HLR new
			database: db;
			hlrNumber: '35412';
			yourself.

	testEndPoint := TCAPTestServiceEndPoint new.
	hlrEndPoint := TCAPTestServiceEndPoint newHLR.
	hlrEndPoint transactionCoordinator: TCAPTestTransactionCoordinator new.
	hlrEndPoint factory hlr: testHlr.
	testHlr endPoint: hlrEndPoint.

	testEndPoint connectTo: hlrEndPoint.
	hlrEndPoint connectTo: testEndPoint.