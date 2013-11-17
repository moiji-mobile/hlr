insert-subscriberdata
subscriberDataFirst
	^ASN1Dictionary new
		at: 'msisdn' put: self msisdnAsE164;
		at: 'category' put: self subscriberCategory;
		at: 'subscriberStatus' put: self subscriberStatus;
		at: 'bearerServiceList' put: self bearerServiceList;
		at: 'teleserviceList' put: self teleServiceList;
		at: 'provisionedSS' put: self ssFirstData;
		at: 'odb-Data' put: 
			(ASN1Dictionary new
				at: 'odb-GeneralData' put: self odbGeneralData;
				yourself);
		yourself