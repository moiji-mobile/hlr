access
ssSecondDataOn: aValue

	"MAP/TCAP/ASN1 is a mess.. we need to avoid segmentation on SCCP
	so we group things into various bits.."
	
	aValue addUsing: [ :item | 
		connectedLineIdentificationRestriction valuesOn: item ].

	"TODO: we might need to check if all of it fits.."
	self provisionedSS do: [:value |
		aValue addUsing: [ :item | 
			value valuesOn: item ]].
	^ aValue