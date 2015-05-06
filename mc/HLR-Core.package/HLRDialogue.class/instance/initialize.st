creation
initialize
	super initialize.

	logger := LogStructuredLogger for: self area: #hlr.
	invocationSubscription := self onInvoke: [:invocation |
		self dispatchInvocation: invocation].