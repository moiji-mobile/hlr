| mongo hlrDb hlr conn tcap |

"Create the Database"
mongo := VOMongoRepository host: 'localhost' database: 'hlrDatabase'.
hlrDb := HLRDatabaseVoyage new
   voyageRepository: mongo;
   yourself.

"Create the HLR with SCF and HLR number to use"
hlr := CamelHLR new.
hlr gsmSCFAddress: '31232132332'.
hlr database: hlrDb.
hlr hlrNumber: '313243242343'.

"Create the connection to the sctp/m3ua<->tcp bridge"
conn := SCCPNetworkServiceOsmoDirect new
   hostname: 'localhost' port: 5002;
   token: 'a-token';
   yourself.

"Initialize the TCAP stack"
tcap := TCAPServiceEndPoint newHLR.
tcap factory hlr: hlr.
tcap networkService: conn.

"Tell the HLR about the TCAP stack for outgoing dialogues"
hlr endPoint: tcap.

"Start the connection"
conn start.
