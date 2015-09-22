insert-subscriber
subscriberDataAsASN1For: aSubscriber
	"We need to segment the data by hand. Here we decide on things"
	| type col first second bearerServiceList  teleServiceList |
	col := OrderedCollection new.
	type := self asn1TypeNamed: 'SubscriberDataV3'.
	first := type newValue
		at: 'msisdn' put: aSubscriber msisdn toE164;
		at: 'category' put: aSubscriber subscriberCategory;
		at: 'subscriberStatus' put: aSubscriber subscriberStatus;
		yourself.
	bearerServiceList := first expandFieldNamed: 'bearerServiceList'.
	aSubscriber bearerServiceList do: [ :bearerService |
		bearerServiceList addUsing:[ :item | item basicValue: bearerService ] ].
	teleServiceList := first expandFieldNamed: 'teleserviceList'.
	aSubscriber teleServiceList do: [ :teleService |
		teleServiceList addUsing:[ :item | item basicValue: teleService ] ].
	 aSubscriber ssFirstData: (first expandFieldNamed: 'provisionedSS').
	(first expandFieldNamed: 'odb-Data')
		at: 'odb-GeneralData' put: (self odbGeneralDataFor: aSubscriber).
		
	second := type newValue.
	aSubscriber ssSecondDataOn: (second expandFieldNamed: 'provisionedSS').
	
	^ {  first . second }