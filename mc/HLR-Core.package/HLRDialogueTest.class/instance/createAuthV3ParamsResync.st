as yet unclassified
createAuthV3ParamsResync
	^	{   
			'imsi' -> '72040800004067F4' byteArrayFromHex .
			're-synchronisationInfo' -> {
				'rand' -> '00112233445566778899AABBCCDDEEFF' byteArrayFromHex.
				'auts' -> #[116 207 157 67 237 230 63 191 124 52 119 151 80 32] } asDictionary.
			'numberOfRequestedVectors' -> 4 } asAsn1ValueTyped: 'SendIdentificationArgV3' in: self asn1Model