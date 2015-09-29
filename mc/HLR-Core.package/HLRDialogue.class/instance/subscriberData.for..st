as yet unclassified
subscriberData: subscriberDataType for: aSubscriber
	"We need to segment the data by hand. Here we decide on things"
	| second first |

	first := subscriberDataType newValue
		at: 'msisdn' put: aSubscriber msisdn toE164;
		at: 'category' put: aSubscriber subscriberCategory;
		at: 'subscriberStatus' put: aSubscriber subscriberStatus;
		expandAt: 'bearerServiceList' using: [ :bearerServiceList |
			aSubscriber bearerServiceList do: [ :bearerService |
				bearerServiceList addUsing:[ :item | item contents: bearerService ] ] ];
		expandAt: 'teleserviceList' using: [ :teleServiceList | 
			aSubscriber teleServiceList do: [ :teleService |
				teleServiceList addUsing:[ :item | item contents: teleService ] ] ];
		expandAt: 'provisionedSS' using: [ :provisionedSS | 
	 			aSubscriber ssFirstData: provisionedSS ];
		expandAt: 'odb-Data' using: [ :data |
			data at: 'odb-GeneralData' put: (self odbGeneralDataFor: aSubscriber) ].
		
	second := subscriberDataType newValue
		expandAt: 'provisionedSS' using: [ :provisionedSS | 
			aSubscriber ssSecondDataOn: provisionedSS ].
	
	^ OrderedCollection with: first with: second 