creation
execute
	pendingInvokes := OrderedCollection new.
	
	self flag: #todo. "This needs to include the IMSI when not done
	as part of the locationUpdate."

	"Avoid using XUDT as part of the spec..."
	self insertSubscriberData: self insertFirst.
	self insertSubscriberData: self insertSecond.