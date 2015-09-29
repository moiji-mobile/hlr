as yet unclassified
createUpdateLocationParams

	^ (self asn1Model typeNamed: 'updateLocation') newValue
		at: 'imsi' put: '72040800004067F4' byteArrayFromHex;
		at: 'msc-Number' put: '916407973671F3' byteArrayFromHex;
		at: 'vlr-Number' put: '916407973671F3' byteArrayFromHex;
		expandAt: 'vlr-Capability' using: [ :item | ];
		yourself