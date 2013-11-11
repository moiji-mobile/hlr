sms
alertServiceCentresFor: aSubscriber 
	self flag: #todo.
	"Check for the other conditions too"
	aSubscriber isMobileStationNotReachable
		ifTrue: [^false].

	aSubscriber messageWaitingSet do: [:smscAddress |
		self alertServiceCentre: smscAddress for: aSubscriber].