as yet unclassified
setUp
	| db |
	db := HLRInImageDatabase new.
	subscriber := Subscriber testSubscriber.
	db insert: subscriber.

	secondSubscriber := Subscriber testSubscriber.
	secondSubscriber msisdn: '242424242424'.
	secondSubscriber imsi: '21332312423'.
	db insert: secondSubscriber.

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