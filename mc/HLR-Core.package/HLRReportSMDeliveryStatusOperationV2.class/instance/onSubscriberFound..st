execution
onSubscriberFound: aSubscriber 
	"Dispatch for the poor"
	deliveryOutcome = 'memoryCapacityExceeded'
		ifTrue: [
			aSubscriber memoryCapcacityExceeded.
			self addToMessageWaitingList: aSubscriber.
			^self finish].
	deliveryOutcome = 'absentSubscriber'
		ifTrue: [
			aSubscriber mobileStationNotPresent.
			self addToMessageWaitingList: aSubscriber.
			^self finish].
	deliveryOutcome = 'successfulTransfer'
		ifTrue: [
			aSubscriber mobileStationIsPresent.
			^self finish].

	"Can not be reached?!"
	self halt.