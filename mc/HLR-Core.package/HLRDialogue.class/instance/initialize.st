creation
initialize
	super initialize.

	invocationSubscription := self onInvoke: [:invocation |
		self dispatchInvocation: invocation].