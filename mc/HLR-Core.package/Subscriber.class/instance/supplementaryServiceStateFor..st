supplementary-services
supplementaryServiceStateFor: aSSCode
	^self supplementaryServiceForCode: aSSCode ifAbsentPut: [SSData new ssCode: aSSCode; yourself]