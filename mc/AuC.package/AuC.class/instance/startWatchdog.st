as yet unclassified
startWatchdog
	watchdogProc := [
		[self
			watchdogSleep;
			watchdogProcess] repeat.
	] newProcess.

	watchdogProc name: 'AuC Watchdog'.
	watchdogProc resume.