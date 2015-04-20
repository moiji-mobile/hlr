forwarding
finishForward: aSubscriber
	| number |
	"We are reuested to forward.."
	number := aSubscriber forwardedToNumber.
	number ifNil: [^self fail].

	self finishForward: aSubscriber number: number.