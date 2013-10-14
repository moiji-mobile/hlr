tests-access
testSsSecondData
	| subscriber data |
	subscriber := Subscriber dummySubscriber.
	data := subscriber ssSecondData.
	ASN1 write: data usingType: (TCAP current model bindingNamed: 'Ext-SS-InfoList') value.