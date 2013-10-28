as yet unclassified
onSuccess: aSubscriber 
	"The subscriber has been found."

	"Check if we unconditionally forward these calls"
	aSubscriber alwaysForwardTeleService
		ifTrue: [^self finishForward: aSubscriber].

	"Do we know where the subscriber is?"
	aSubscriber vlrNumber isNil
		ifTrue: [^self maybeForward: aSubscriber].
	aSubscriber mscNumber isNil
		ifTrue: [^self maybeForward: aSubscriber].

	"Provide a roaming number and continue."
	self querySubscriberInformation: aSubscriber.