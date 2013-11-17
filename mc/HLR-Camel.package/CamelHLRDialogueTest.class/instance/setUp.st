as yet unclassified
setUp
	| db |
	db := HLRInImageDatabase new.
	subscriber := CamelSubscriber testSubscriber.
	db insert: subscriber.
	testHlr := CamelHLR new
			database: db;
			hlrNumber: '35412';
			iwmscNumber: '35413';
			gsmSCFAddress: '1234';
			yourself.

	testEndPoint := TCAPTestServiceEndPoint new.
	hlrEndPoint := TCAPTestServiceEndPoint newCamelHLR.
	hlrEndPoint transactionCoordinator: TCAPTestTransactionCoordinator new.
	hlrEndPoint factory hlr: testHlr.
	testHlr endPoint: hlrEndPoint.

	testEndPoint connectTo: hlrEndPoint.
	hlrEndPoint connectTo: testEndPoint.