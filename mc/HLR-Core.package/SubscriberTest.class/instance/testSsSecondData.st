tests-access
testSsSecondData
	| subscriber data |
	subscriber := Subscriber dummySubscriber.
	data := subscriber ssSecondData.
	ASN1 write: data usingType: (self asn1Model bindingNamed: 'Ext-SS-InfoList') value.