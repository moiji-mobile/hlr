as yet unclassified
setUp
	testEndPoint := TCAPServiceEndPoint new.
	hlrEndPoint := TCAPServiceEndPoint newHLR.

	testEndPoint connectTo: hlrEndPoint.
	hlrEndPoint connectTo: testEndPoint.