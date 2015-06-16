as yet unclassified
subscriberFound: aResult
	| subscriber algorithmCode |
	subscriber := Subscriber new. 
	subscriber imsi: imsi.
	subscriber iccid: (aResult atName: 'Subscriber_ICCID').
	algorithmCode := aResult atName: 'ALGORITHMCODE'.
	algorithmCode = 0
		ifTrue: [
			| credential |
			credential := SubscriberMilenageCredentials new
				ki: (ByteArray readHexFrom: (aResult atName: 'KI'));
				opc: (ByteArray readHexFrom: (aResult atName: 'OPC'));
				amf: #[0 0];
				sqn: (aResult atName: 'SQN');
				yourself.
			subscriber credentials: credential]
		ifFalse: [
			| credential |
			credential := SubscriberCOMP128Credentials new
				a3a8Version: algorithmCode;
				ki: (ByteArray readHexFrom: (aResult atName: 'KI'));
				yourself.
			subscriber credentials: credential].

	onSuccess value: subscriber.