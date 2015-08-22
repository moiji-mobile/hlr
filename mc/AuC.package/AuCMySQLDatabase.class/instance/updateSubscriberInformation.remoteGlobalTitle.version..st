as yet unclassified
updateSubscriberInformation: aSubscriber remoteGlobalTitle: aGT version: aVersion
	| res |
	subscriberInformation params: Dictionary new.
	subscriberInformation at: 1 bind: aGT.
	subscriberInformation at: 2 bind: aVersion.
	subscriberInformation at: 3 bind: aSubscriber iccid.


	"The interface needs to be considered async"
	res := subscriberInformation execute.
	logger logDebug: 'updateSubscriberInformation update' with: {'updated' -> res affectedRows. 'imsi' -> aSubscriber imsi. 'gt' -> aGT. 'version' -> aVersion}.