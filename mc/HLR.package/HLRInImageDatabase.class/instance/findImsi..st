internal
findImsi: anImsi
	^ self imsis at: anImsi ifAbsent: [^nil].