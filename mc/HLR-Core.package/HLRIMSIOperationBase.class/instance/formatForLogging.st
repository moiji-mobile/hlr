logging
formatForLogging
	^String streamContents: [:stream |
		stream nextPutAll: self class printString;
			nextPut: $(;
			nextPutAll: 'imsi=';
			nextPutAll: (imsi isNil ifTrue: ['nil'] ifFalse: [imsi]);
			nextPut: $)].