testing
populateWithDummySubscribers: aDb

	274080000003001 to: 274080001003001 do: [ :imsi |
		| sub |
		sub := Subscriber dummySubscriber.
		sub imsi: imsi asString.
		aDb insert: sub.
 	]