forwarding
maybeForward: aSubscriber
	"There is no VLR/MSC"
	
	"Forward to mailbox or somewhere else?"
	aSubscriber maybeForward
		ifTrue: [^self finishForward: aSubscriber].

	self flag: #todo. "Enumeration value.."
	invocation returnError: 'absentSubscriber' with: (
					ASN1Dictionary new
						at: 'absentSubscriberReason' put: 'imsiDetach';
						yourself).