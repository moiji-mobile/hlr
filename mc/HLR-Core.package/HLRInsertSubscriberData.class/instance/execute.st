creation
execute
	pendingInvokes := OrderedCollection new.

	"Avoid using XUDT as part of the spec..."
	self insertSubscriberData: self insertFirst.
	self insertSubscriberData: self insertSecond.
	self shouldBeImplemented