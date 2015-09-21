insert-subscriber
subscriberDataAsASN1For: aSubscriber
	"We need to segment the data by hand. Here we decide on things"
	self halt.
	^OrderedCollection new
		add: (ASN1Dictionary new
			at: 'msisdn' put: aSubscriber msisdn toE164;
			at: 'category' put: aSubscriber subscriberCategory;
			at: 'subscriberStatus' put: aSubscriber subscriberStatus;
			at: 'bearerServiceList' put: aSubscriber bearerServiceList;
			at: 'teleserviceList' put: aSubscriber teleServiceList;
			at: 'provisionedSS' put: aSubscriber ssFirstData;
			at: 'odb-Data' put: 
				(ASN1Dictionary new
					at: 'odb-GeneralData' put: (self odbGeneralDataFor: aSubscriber);
					yourself);
			yourself);
		add: (ASN1Dictionary new
			at: 'provisionedSS' put: aSubscriber ssSecondData;
			yourself);
		yourself