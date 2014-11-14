as yet unclassified
setUp
	| db |
	db := HLRInImageDatabase new.
	subscriber := CamelSubscriber testSubscriber.
	db insert: subscriber.
	testHlr := CamelHLR new
			database: db;
			hlrNumber: '35412';
			gsmSCFAddress: '1234';
			yourself.

	testEndPoint := TCAPTestServiceEndPoint new
		asn1Model: self asn1Model.
	hlrEndPoint := TCAPTestServiceEndPoint newCamelHLR
		asn1Model: self asn1Model.
	hlrEndPoint transactionCoordinator: TCAPTestTransactionCoordinator new.
	hlrEndPoint factory hlr: testHlr.
	testHlr endPoint: hlrEndPoint.

	testEndPoint connectTo: hlrEndPoint.
	hlrEndPoint connectTo: testEndPoint.