sms
alertServiceCentresFor: aSubscriber 
	self flag: #todo.
	"Check for the other conditions too"
	aSubscriber isMobileStationNotReachable
		ifTrue: [^false].

	aSubscriber messageWaitingSet do: [:assoc |
		self alertServiceCentre: assoc value iwmsc: assoc key for: aSubscriber].