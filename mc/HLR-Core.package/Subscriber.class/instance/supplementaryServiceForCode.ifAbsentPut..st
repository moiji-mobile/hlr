supplementary-services
supplementaryServiceForCode: aSSCode ifAbsentPut: aBlock
	^self provisionedSS at: aSSCode ifAbsentPut: aBlock