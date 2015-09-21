as yet unclassified
createAuthV3Params
	^ (self newValueForTypeNamed: 'SendIdentificationArgV3')  
			imsi: '72040800004067F4' byteArrayFromHex;
			numberOfRequestedVectors: 4;
			yourself