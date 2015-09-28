insert-subscriber
subscriberDataAsASN1For: aSubscriber
	| collection |
	collection := super subscriberDataAsASN1For: aSubscriber.

	"Add *-CSI data"
	(hlr camelAllowedForDialogue: self) ifTrue: [
		aSubscriber camelPhaseTwoSupported ifTrue: [
			collection add: (aSubscriber camelSubscriberInfoAsASN1: hlr)]].

	^collection.