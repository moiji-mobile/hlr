tests-access
testSsSecondData
	| subscriber data value type |
	type := (self asn1Model bindingNamed: 'Ext-SS-InfoList') value.
	subscriber := Subscriber dummySubscriber.
	value := type newValue.
	data := subscriber ssSecondDataOn: value.
	ASN1 write: data usingType: (self asn1Model bindingNamed: 'Ext-SS-InfoList') value.