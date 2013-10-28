forwarding
maybeForward: aSubscriber
	"There is no VLR/MSC"
	
	"Forward to mailbox or somewhere else?"
	aSubscriber maybeForward
		ifTrue: [^self finishForward: aSubscriber].

	self flag: #todo. "Error handling in rose"
	invocation returnError: 'absentSubscriber'.