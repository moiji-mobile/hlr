forwarding
finishForward: aSubscriber
	| number |
	"We are reuested to forward.."
	number := aSubscriber forwardingNumber.
	number ifNil: [^self fail].

	self finishWithRoute: aSubscriber number: aSubscriber forwardingNumber.