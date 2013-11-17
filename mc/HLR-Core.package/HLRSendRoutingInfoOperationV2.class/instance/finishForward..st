forwarding
finishForward: aSubscriber
	| number |
	"We are reuested to forward.."
	number := aSubscriber forwardedToNumberAsE164.
	number ifNil: [^self fail].

	self finishForward: aSubscriber number: number.