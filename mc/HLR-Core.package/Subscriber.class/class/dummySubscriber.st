as yet unclassified
dummySubscriber
	^self new
		imsi: '274080000003000';
		msisdn: '354385009999';
		credentials: (SubscriberCOMP128Credentials initWith: (ByteArray readHexFrom: '00112233445566778899AABBCCDDEEFF'));
		subscriberCategory: #[16r0a];
		subscriberStatus: 'operatorDeterminedBarring';
		bearerServiceProfile: BearerServiceProfile defaultProfile;
		teleServiceProfile: TeleServiceProfile defaultProfile;
		ssCallingLineIdentificationPresentation: self ssClipDefault;
		ssCallingLineIdentiticationRestriction: self ssClirDefault;
		ssConnectedLineIdentificationPresentation: self ssColpDefault;
		ssConnectedLineIdentificationRestriction: self ssColrDefault;
		"GPRS related attributes"
		teleServiceProfileGPRS: TeleServiceProfileGPRS defaultProfile;
		applicationContextName: (ByteArray readHexFrom: '08696e7465726e6574');
		yourself.