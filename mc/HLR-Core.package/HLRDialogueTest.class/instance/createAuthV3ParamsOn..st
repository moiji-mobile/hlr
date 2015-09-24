as yet unclassified
createAuthV3ParamsOn: aValue
	^ aValue
			imsi: '72040800004067F4' byteArrayFromHex;
			numberOfRequestedVectors: 4;
			yourself