insert-subscriber
subscriberDataAsnASN1For: aSubscriber
	| collection |
	collection := super subscriberDataAsASN1: aSubscriber.

	"Add *-CSI data"
	(hlr camelAllowedForDialogue: self) ifTrue: [
		self camelPhaseTwoSupported ifTrue: [
			collection add: (self camelSubscriberInfoAsASN1: hlr)]].

	^collection.