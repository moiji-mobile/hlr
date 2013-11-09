sms
alertServiceCentresFor: aSubscriber 
	self flag: #todo.
	"Check for the other conditions too"
	aSubscriber mobileStationNotReachable
		ifTrue: [^false].

	aSubscriber messageWaitingSet do: [:smscAddress |
		self alertServiceCentre: smscAddress for: aSubscriber].