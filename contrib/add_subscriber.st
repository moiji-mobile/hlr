| mongo hlrDb |
mongo := VOMongoRepository host: 'localhost' database: 'hlrDatabase'.
hlrDb := HLRDatabaseVoyage new
    voyageRepository: mongo;
    yourself.


"Initialize dummies (if they don't exist yet)"
BearerServiceProfile defaultVoyageProfile: hlrDb.
TeleServiceProfileGPRS defaultVoyageProfile: hlrDb.
TeleServiceProfile defaultVoyageProfile: hlrDb.


"Now insert subscribers"
hlrDb
    updateSubscriber:
        (Subscriber dummySubscriber
            applicationContextName: (ByteArray readHexFrom: '08696e7465726e6574');
            imsi: '5435018000009029'; msisdn: '4421321323';
            credentials: (SubscriberMilenageCredentials new
                            sqn: 16rFFFFFFFFFFFF;
                            opc: (ByteArray new: 16);
                            ki: (ByteArray new: 16);
                            yourself);
            yourself)
