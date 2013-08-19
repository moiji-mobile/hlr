internal
findImsi: anImsi
	^ imsis at: anImsi ifAbsent: [^nil].