tuple
generateAuthenticationListFor: aSubscriber count: numVectors
	| res |
	res := OrderedCollection new.

	numVectors timesRepeat: [
		| rand sreskc dict |
		rand := (UUIDGenerator default generateRandomBitsOfLength: 16*8) asByteArray.
		sreskc := aSubscriber generateSRESKc: rand.

		dict := ASN1Dictionary new
			at: 'rand' put: rand hex;
			at: 'sres' put: (sreskc copyFrom: 1 to: 4) hex;
			at: 'kc' put: (sreskc copyFrom: 5 to: 12) hex;
			yourself.
		res add: dict.
	].

	^res