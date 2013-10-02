as yet unclassified
testSubscriber
	^Subscriber new
		imsi: '274080000004764';
		ki: (ByteArray readHexFrom: '00112233445566778899AABBCCDDEEFF');
		yourself.