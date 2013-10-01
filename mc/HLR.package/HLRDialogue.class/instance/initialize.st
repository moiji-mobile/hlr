creation
initialize
	super initialize.

	self onInvoke: [:invocation |
		self dispatchInvocation: invocation].