data
insertFirst
	^ASN1Dictionary new
		at: 'msisdn' put: subscriber msisdn;
		at: 'category' put: subscriber subscriberCategory;
		at: 'subscriberStatus' put: subscriber subscriberStatus;
		at: 'bearerServiceList' put: subscriber bearerServiceList;
		at: 'teleserviceList' put: subscriber teleServiceList;
		at: 'provisionedSS' put: subscriber ssFirstData;
		at: 'odb-Data' put: 
			(ASN1Dictionary new
				at: 'odb-GeneralData' put: subscriber odbGeneralData;
				yourself);
		yourself