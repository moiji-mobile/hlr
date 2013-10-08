as yet unclassified
dummySubscriber
	^Subscriber new
		imsi: '274080000003000';
		msisdn: '1234';
		ki: (ByteArray readHexFrom: '00112233445566778899AABBCCDDEEFF');
		subscriberCategory: '0a';
		subscriberStatus: 'operatorDeterminedBarring';
		bearerServiceProfile: BearerServiceProfile defaultProfile;
		teleServiceProfile: TeleServiceProfile defaultProfile;
		ssCallingLineIdentificationPresentation: self ssClipDefault;
		ssCallingLineIdentiticationRestriction: self ssClirDefault;
		ssConnectedLineIdentificationPresentation: self ssColpDefault;
		ssConnectedLineIdentificationRestriction: self ssColrDefault;
		odbGeneralData: self defaultOdbGeneralData;
		yourself.