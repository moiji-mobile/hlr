as yet unclassified
ssStatus
	| status |
	status := 0.
	status := status bitAt: 1 put: activeBit asBit.
	status := status bitAt: 2 put: registeredBit asBit.
	status := status bitAt: 3 put: provisionedBit asBit.
	status := status bitAt: 4 put: notOperativeBit asBit.

	^ (ByteArray with: status)