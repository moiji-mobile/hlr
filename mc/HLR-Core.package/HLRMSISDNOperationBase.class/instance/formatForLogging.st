logging
formatForLogging
	^String streamContents: [:stream |
		stream nextPutAll: self class printString;
			nextPut: $(;
			nextPutAll: 'msisdn=';
			nextPutAll: (msisdn isNil ifTrue: ['nil'] ifFalse: [msisdn]);
			nextPut: $)].