as yet unclassified
createAuthV3ParamsResync
	| param |
	param := (self newValueForTypeNamed: 'SendIdentificationArgV3')  
			imsi: '72040800004067F4' byteArrayFromHex;
			yourself .
	param beSelfExpanding re_synchronisationInfo 
				rand: '00112233445566778899AABBCCDDEEFF' byteArrayFromHex;
				auts: #[116 207 157 67 237 230 63 191 124 52 119 151 80 32].
	param numberOfRequestedVectors: 4.
	^ param