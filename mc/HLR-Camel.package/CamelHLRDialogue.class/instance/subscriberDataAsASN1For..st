insert-subscriber
subscriberDataAsASN1For: aSubscriber
	| type collection |
	type := self asn1TypeNamed: 'SubscriberDataV3'.
	collection := super subscriberData: type for: aSubscriber.

	"Add *-CSI data"
	(hlr camelAllowedForDialogue: self) ifTrue: [
		aSubscriber camelPhaseTwoSupported ifTrue: [
			collection add: (aSubscriber camelSubscriberInfo: type newValue for: hlr)]].

	^collection.