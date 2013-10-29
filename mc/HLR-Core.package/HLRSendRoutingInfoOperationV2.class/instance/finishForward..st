forwarding
finishForward: aSubscriber
	| number |
	"We are reuested to forward.."
	number := aSubscriber forwardingNumberAsE164.
	number ifNil: [^self fail].

	self finishWithRoute: aSubscriber number: number.