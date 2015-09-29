insert-subscriber
subscriberData: subscriberDataType for: aSubscriber
	| collection |
	collection := super subscriberData: subscriberDataType for: aSubscriber.

	"Add *-CSI data"
	(hlr camelAllowedForDialogue: self) ifTrue: [
		aSubscriber camelPhaseTwoSupported ifTrue: [
			collection add: (aSubscriber camelSubscriberInfo: subscriberDataType newValue for: hlr)]].

	^collection.