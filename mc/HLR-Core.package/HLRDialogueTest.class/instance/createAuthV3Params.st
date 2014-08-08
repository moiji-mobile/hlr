as yet unclassified
createAuthV3Params
	^ASN1Dictionary new 
	at: 'imsi' put:'72040800004067F4' byteArrayFromHex;
	at: 'numberOfRequestedVectors' put: 4;
	yourself