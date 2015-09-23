tuple
generateAuthenticationListFor: aSubscriber count: numVectors type: aType
	| res |
	res := OrderedCollection new.

	numVectors timesRepeat: [
		| rand sreskc dict |

		rand := RAND rand: 16.
		sreskc := aSubscriber credentials generateSRESKc: rand.

		dict := aType newValue
			at: 'rand' put: rand;
			at: 'sres' put: (sreskc copyFrom: 1 to: 4);
			at: 'kc' put: (sreskc copyFrom: 5 to: 12);
			yourself.
		res add: dict.
	].

	^res