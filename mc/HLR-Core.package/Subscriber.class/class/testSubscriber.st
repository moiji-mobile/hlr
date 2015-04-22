as yet unclassified
testSubscriber
	^self new
		imsi: '274080000004764';
		msisdn: '1234';
		ki: (ByteArray readHexFrom: '00112233445566778899AABBCCDDEEFF');
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
		applicationContextName: (ByteArray readHexFrom: '025f66');
		yourself.