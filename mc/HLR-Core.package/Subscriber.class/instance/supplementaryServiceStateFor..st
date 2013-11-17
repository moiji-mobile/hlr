supplementary-services
supplementaryServiceStateFor: aSSCode
	^self supplementaryServiceForCode: aSSCode ifAbsentPut: [(self class supplementaryServiceFor: aSSCode) ssCode: aSSCode; yourself]