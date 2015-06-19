as yet unclassified
startWatchdog
	watchdogProc := [
		self
			watchdogSleep;
			watchdogProcess.
	] newProcess.

	watchdogProc name: 'AuC Watchdog'.
	watchdogProc resume.