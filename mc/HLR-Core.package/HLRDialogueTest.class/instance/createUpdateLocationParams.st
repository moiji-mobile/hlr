as yet unclassified
createUpdateLocationParams
	^ASN1Dictionary new
		at: 'imsi' put: '72040800004067F4' byteArrayFromHex;
		at: 'msc-Number' put: '916407973671F3' byteArrayFromHex;
		at: 'vlr-Number' put: '916407973671F3' byteArrayFromHex;
		at: 'vlr-Capability' put: '';
		yourself