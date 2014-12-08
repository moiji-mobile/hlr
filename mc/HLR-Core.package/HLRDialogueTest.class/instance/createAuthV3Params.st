as yet unclassified
createAuthV3Params
	^	{   
			'imsi' -> '72040800004067F4' byteArrayFromHex .
			'numberOfRequestedVectors' -> 4 } asAsn1ValueTyped: 'SendIdentificationArgV3' in: self asn1Model