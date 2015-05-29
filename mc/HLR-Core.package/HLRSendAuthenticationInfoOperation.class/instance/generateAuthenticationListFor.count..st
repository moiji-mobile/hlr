tuple
generateAuthenticationListFor: aSubscriber count: numVectors
	| res |
	res := OrderedCollection new.

	'/dev/urandom' asFileReference readStreamDo: [:randStream |
		randStream binary.

		numVectors timesRepeat: [
			| rand sreskc dict |

			rand := randStream next: 16.
			sreskc := aSubscriber credentials generateSRESKc: rand.

			dict := ASN1Dictionary new
				at: 'rand' put: rand;
				at: 'sres' put: (sreskc copyFrom: 1 to: 4);
				at: 'kc' put: (sreskc copyFrom: 5 to: 12);
				yourself.
			res add: dict.
		]].

	^res