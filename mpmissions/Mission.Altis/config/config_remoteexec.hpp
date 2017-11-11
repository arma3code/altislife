#define F(NAME,TARGET) class NAME { \
	allowedTargets = TARGET; \
};
#define ANYONE 0
#define CLIENT 1
#define SERVER 2
#define HC HC_Life

class CfgRemoteExec {
	class Functions {
		mode = 2;
		jip = 1;

		/* Client only functions */
		F(UnionClient_session_requestReceived,CLIENT)		

		/* Server only functions */
		F(ExtremoServer_database_asyncCall,SERVER)		

		/* HeadlessClient only functions */		
		F(ExtremoHeadless_system_asyncCall,HC)		

		/* Functions for everyone */
		F(UnionClient_system_index,ANYONE)
	};
	
	class Commands {
		mode = 1;
		jip = 1;
				
		F(call,ANYONE)
		F(setFace,ANYONE)
	};
};
