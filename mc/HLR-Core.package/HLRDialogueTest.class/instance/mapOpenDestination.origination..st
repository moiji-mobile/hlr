as yet unclassified
mapOpenDestination: destination origination: origination
	| mapPdu |
	mapPdu := (self asn1Model typeNamed: 'MAP-DialoguePDU') newValue.
	(mapPdu expandFieldNamed: 'map-open')
		destinationReference: destination;
		originationReference: origination.
	^ mapPdu asExternalValue: '0.4.0.0.1.1.1.1'.