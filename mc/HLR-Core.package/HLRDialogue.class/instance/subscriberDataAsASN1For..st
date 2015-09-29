insert-subscriber
subscriberDataAsASN1For: aSubscriber
	"We need to segment the data by hand. Here we decide on things"
	| type       |

	type := self asn1TypeNamed: 'SubscriberDataV3'.
	^ self subscriberData: type for: aSubscriber 