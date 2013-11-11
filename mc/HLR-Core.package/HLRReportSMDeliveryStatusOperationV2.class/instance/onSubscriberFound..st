execution
onSubscriberFound: aSubscriber 
	"Dispatch for the poor"
	deliveryOutcome = 'memoryCapacityExceeded'
		ifTrue: [
			aSubscriber memoryCapcacityExceeded.
			^self addToMessageWaitingList: aSubscriber].
	deliveryOutcome = 'absentSubscriber'
		ifTrue: [
			aSubscriber mobileStationNotPresent.
			^self addToMessageWaitingList: aSubscriber].
	deliveryOutcome = 'successfulTransfer'
		ifTrue: [
			aSubscriber mobileStationIsPresent.
			^dialogue requestTcEnd: false].

	"Can not be reached?!"
	self halt.