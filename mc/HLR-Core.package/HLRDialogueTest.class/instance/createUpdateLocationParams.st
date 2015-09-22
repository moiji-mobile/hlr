as yet unclassified
createUpdateLocationParams
	| value |
	value := (self newValueForTypeNamed: 'UpdateLocationArg')  
		at: 'imsi' put: '72040800004067F4' byteArrayFromHex;
		at: 'msc-Number' put: '916407973671F3' byteArrayFromHex;
		at: 'vlr-Number' put: '916407973671F3' byteArrayFromHex;
		yourself.
	value expandFieldNamed:  'vlr-Capability'.
	^ value