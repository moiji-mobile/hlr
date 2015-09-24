as yet unclassified
createAuthV3ParamsSGSN: aValue
	^ aValue
		imsi: '72040800004067F4' byteArrayFromHex;
		numberOfRequestedVectors: 4;
		requestingNodeType: 'sgsn';
		yourself