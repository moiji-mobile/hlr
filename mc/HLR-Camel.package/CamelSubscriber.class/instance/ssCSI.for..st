capabilityHandling
ssCSI: sscsi for: aHlr
	^ sscsi
		expandAt: 'ss-CamelData' using: [ :camelData | 
			camelData 
				expandAt: 'ss-EventList' using: [ :item | ];
				at: 'gsmSCF-Address' put: (self gsmSCFAddressToUse: aHlr) toE164 ]