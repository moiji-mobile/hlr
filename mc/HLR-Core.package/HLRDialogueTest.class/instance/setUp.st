as yet unclassified
setUp
	| db |
	db := HLRInImageDatabase new.
	db insert: Subscriber testSubscriber.
	testHlr := HLR new
			database: db;
			yourself.

	testEndPoint := TCAPServiceEndPoint new.
	hlrEndPoint := TCAPServiceEndPoint newHLR.
	hlrEndPoint factory hlr: testHlr.

	testEndPoint connectTo: hlrEndPoint.
	hlrEndPoint connectTo: testEndPoint.