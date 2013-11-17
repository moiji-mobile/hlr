capabilityHandling
subscriberDataAsASN1: aHlr
	| collection |
	collection := super subscriberDataAsASN1: aHlr.

	"Add *-CSI data"
	self camelPhaseTwoSupported ifTrue: [
		collection add: (self camelSubscriberInfoAsASN1: aHlr)].

	^collection.