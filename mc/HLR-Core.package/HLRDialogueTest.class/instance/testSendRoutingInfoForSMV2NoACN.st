tests-infoRetrievalPackage
testSendRoutingInfoForSMV2NoACN
	| sri  |

	self assert: secondSubscriber isMobileStationNotReachable.
	self assert: secondSubscriber messageWaitingSet isEmpty.

	"Test for broken equipment that do not include the Application-Context-Name"
	sri := #[9 0 3 5 7 2 66 6 2 66 7 41 98 39 72 4 24 0 52 2 108 31 161 29 2 1 1 2 1 45 48 21 128 7 145 66 66 66 66 66 66 129 1 255 130 7 145 100 7 5 144 16 242].
	
	hlrEndPoint injectSCCP: sri.
	self deny: secondSubscriber messageWaitingSet isEmpty.