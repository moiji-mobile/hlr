tuple
generateAuthenticationListFor: aSubscriber count: numVectors
	| res |
	res := OrderedCollection new.

	numVectors timesRepeat: [
		| uuid rand sreskc dict |
		uuid := (UUIDGenerator default generateRandomBitsOfLength: 16*8) asByteArray.
		rand := (ByteArray new: 16) copyReplaceFrom: 1 to: uuid size with: uuid.
		sreskc := aSubscriber generateSRESKc: rand.

		dict := ASN1Dictionary new
			at: 'rand' put: rand hex;
			at: 'sres' put: (sreskc copyFrom: 1 to: 4) hex;
			at: 'kc' put: (sreskc copyFrom: 5 to: 12) hex;
			yourself.
		res add: dict.
	].

	^res