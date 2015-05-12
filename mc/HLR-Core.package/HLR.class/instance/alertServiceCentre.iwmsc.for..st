sms
alertServiceCentre: aSmscAddress iwmsc: aMscSCCPAddress for: aSubscriber 
	"From 09.02: The MWD entry is deleted when the positive acknowledge
	is received from the IWMSC. The unsuccessful alert may be repeated.
	The MWD entry should be purged in the unsuccessful case, at least
	when a suitable time period has expired."
	"For me this is one try.. right now."

	HLRAlertServiceCentreOperation new
		dialogueHandler: endPoint;
		msisdn: aSubscriber msisdn toE164;
		smscAddress: aSmscAddress toE164;
		hlr: self;
		hlrAddress: self hlrNumber;
		remoteSCCPAddress: aMscSCCPAddress;
		onSuccess: [
			self database removeMessageWaitingEntryFor: aSubscriber serviceCentre: aSmscAddress];
		onFailure: [
			self database removeMessageWaitingEntryFor: aSubscriber serviceCentre: aSmscAddress];
		startWithNewDialogue.