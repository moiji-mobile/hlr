dispatch
indicationTcBegin: aDialogue userInfo: anObject componentsPresent: aBoolean
	self flag: #todo. "We can ask the aDialogue for the ACN and in the future for the
	component and then we can take a look at the acnMapping and do a self perform:with:..."