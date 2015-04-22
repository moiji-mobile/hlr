as yet unclassified
createAuthV3ParamsSGSN
	^ASN1Dictionary new 
	at: 'imsi' put:'72040800004067F4' byteArrayFromHex;
	at: 'numberOfRequestedVectors' put: 4;
	at: 'requestingNodeType' put: 'sgsn';
	yourself