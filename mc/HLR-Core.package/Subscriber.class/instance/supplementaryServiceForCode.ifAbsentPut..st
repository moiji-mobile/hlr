supplementary-services
supplementaryServiceForCode: aSSCode ifAbsentPut: aBlock
	^self supplementaryServiceForCode: aSSCode ifAbsent: [provisionedSS add: aBlock value].