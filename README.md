HLR [![Build Status](https://travis-ci.org/moiji-mobile/hlr.svg?branch=master)](https://travis-ci.org/moiji-mobile/hlr) [![Test Status](https://api.bob-bench.org/v1/badgeByUrl?branch=master&hosting=github&ci=travis-ci&repo=moiji-mobile%2Fhlr)](https://bob-bench.org/r/gh/moiji-mobile/hlr)
=====

Pre-production HLR and in-production AuC

This is a complete Free Software HLR to be used by MNOs/MVNOs. It is
relying on a commercial grade TCAP stack and is easy to extend and
customize. For deployment some parts will probably be adjusted. This
would include disabling the message waitinglist in favor for SMS
home routing, adding access list and changing the database integration.
All of these are trivial modifications once the code should be used
in a production environment.

The AuC was separated and modified to support an existing MySQL
database schema to replace a LeibICT AuC in production. The code
remains in production use for 2G and 3G subscribers.
