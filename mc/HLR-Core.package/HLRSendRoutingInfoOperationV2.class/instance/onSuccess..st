as yet unclassified
onSuccess: aSubscriber 
	"The subscriber has been found."
	| res |

	"TODO: Check if the subscriber is in a VLR/MSC.. and then get a roaning number"
	res := ASN1Dictionary new
		at: 'imsi' put: aSubscriber imsiAsTBCD;
		at: 'routingInfo' put: nil;
		yourself.

	self halt.