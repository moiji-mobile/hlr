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
			at: 'sres' put: sreskc first;
			at: 'kc' put: sreskc second;
			yourself.
		res add: dict.
	].

	^res