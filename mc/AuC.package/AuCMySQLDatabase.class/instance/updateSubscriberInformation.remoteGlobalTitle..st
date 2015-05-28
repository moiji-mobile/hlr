as yet unclassified
updateSubscriberInformation: anImsi remoteGlobalTitle: aGT
	| res |
	subscriberInformation params: Dictionary new.
	subscriberInformation at: 1 bind: aGT.
	subscriberInformation at: 2 bind: anImsi.

	"The interface needs to be considered async"
	res := subscriberInformation execute.
	logger logDebug: 'updateSubscriberInformation update' with: {'updated' -> res affectedRows. 'imsi' -> anImsi. 'gt' -> aGT}.