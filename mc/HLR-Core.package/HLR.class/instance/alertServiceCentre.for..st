sms
alertServiceCentre: aSmscAddress for: aSubscriber 
	"From 09.02: The MWD entry is deleted when the positive acknowledge
	is received from the IWMSC. The unsuccessful alert may be repeated.
	The MWD entry should be purged in the unsuccessful case, at least
	when a suitable time period has expired."
	"For me this is one try.. right now."

	HLRAlertServiceCentreOperation new
		dialogueHandler: endPoint;
		msisdn: aSubscriber msisdnAsE164;
		smscAddress: aSmscAddress;
		hlrAddress: self hlrNumber;
		remoteAddress: self iwmscNumber;
		remoteSSN: #msc;
		onSuccess: [aSubscriber removeFromWaitingList: aSmscAddress. self database updateSubscriber: aSubscriber];
		onFailure: [aSubscriber removeFromWaitingList: aSmscAddress. self database updateSubscriber: aSubscriber];
		startWithNewDialogue.