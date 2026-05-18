%linear engagement simulation - parameter initialization

%target initialization
VT = 40;
AT = 3;

%missile initialization
VM = 100;
Tautopilot = 0;
MAX_ACC = 7;

%scenario initialization
HE = 0*(-30/180*pi); %Heading error (RAD)
TFINAL = 10; 

%scenario duration (for comparison with Non Linear simulator)
%TFINAL = 1000/(VM+VT);

%%%% DO NOT CHANGE BELOW THIS LINE

%compute other initial values (Head-on)
VC = VM+VT;

