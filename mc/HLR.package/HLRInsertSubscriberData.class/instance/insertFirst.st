data
insertFirst
	^ASN1Dictionary new
		at: 'msisdn' put: subscriber msisdn;
		at: 'category' put: subscriber subscriberCategory;
		at: 'subscriberStatus' put: subscriber subscriberStatus;
		at: 'bearerServiceList' put: subscriber bearerServiceList;
		at: 'teleserviceList' put: subscriber teleServiceList;
		at: 'provisionedSS' put: subscriber provisionedSS;
		at: 'odb-data' put: subscriber odbData;
		yourself