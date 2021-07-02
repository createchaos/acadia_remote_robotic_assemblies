MODULE 1_T_ROB2
VAR confdata conf := [0,0,0,0];
VAR syncident sync1;
VAR syncident sync2;
TASK PERS tasks all_tasks{2} := [["T_ROB1"], ["T_ROB2"]];
PERS tooldata DefaultTool:=[TRUE,[[0.000,0.000,0.000],[1.0000,0.0000,0.0000,0.0000]],[0.001,[0.000,0.000,0.001],[1,0,0,0],0,0,0]];
TASK PERS wobjdata DefaultFrame:=[FALSE,TRUE,"",[[0.000,0.000,0.000],[1.0000,0.0000,0.0000,0.0000]],[[0,0,0],[1,0,0,0]]];
TASK PERS speeddata DefaultSpeed:=[100.00,180.00,5000.00,1080.00];
PROC Main()
ConfL \Off;
SyncMoveOn sync1, all_tasks;
MoveAbsJ [[80.479,-32.160,57.309,85.923,98.612,64.544],[365.75,9E9,9E9,9E9,9E9,9E9]]\ID:=0,DefaultSpeed,fine,DefaultTool;
MoveJ [[681.92,912.60,1040.68],[-0.7071,0.0000,0.7071,0.0000],[0,0,0,0],[681.92,9E9,9E9,9E9,9E9,9E9]]\ID:=1,DefaultSpeed,fine,DefaultTool \WObj:=DefaultFrame;
MoveJ [[1005.63,994.73,1040.68],[-0.7071,0.0000,0.7071,0.0000],[0,0,0,0],[1005.63,9E9,9E9,9E9,9E9,9E9]]\ID:=2,DefaultSpeed,fine,DefaultTool \WObj:=DefaultFrame;
MoveJ [[1336.30,1040.66,1040.68],[-0.7071,0.0000,0.7071,0.0000],[0,0,0,0],[1336.30,9E9,9E9,9E9,9E9,9E9]]\ID:=3,DefaultSpeed,fine,DefaultTool \WObj:=DefaultFrame;
MoveJ [[1670.01,1037.70,1040.68],[-0.7071,0.0000,0.7071,0.0000],[0,0,0,0],[1670.01,9E9,9E9,9E9,9E9,9E9]]\ID:=4,DefaultSpeed,fine,DefaultTool \WObj:=DefaultFrame;
MoveJ [[1999.24,982.61,1040.68],[-0.7071,0.0000,0.7071,0.0000],[0,0,0,0],[1999.24,9E9,9E9,9E9,9E9,9E9]]\ID:=5,DefaultSpeed,fine,DefaultTool \WObj:=DefaultFrame;
MoveJ [[2324.12,904.79,1040.68],[-0.7071,0.0000,0.7071,0.0000],[0,0,0,0],[2324.12,9E9,9E9,9E9,9E9,9E9]]\ID:=6,DefaultSpeed,fine,DefaultTool \WObj:=DefaultFrame;
MoveJ [[2653.88,852.21,1040.68],[-0.7071,0.0000,0.7071,0.0000],[0,0,0,0],[2653.88,9E9,9E9,9E9,9E9,9E9]]\ID:=7,DefaultSpeed,fine,DefaultTool \WObj:=DefaultFrame;
MoveJ [[2987.42,836.81,1040.68],[-0.7071,0.0000,0.7071,0.0000],[0,0,0,0],[2987.42,9E9,9E9,9E9,9E9,9E9]]\ID:=8,DefaultSpeed,fine,DefaultTool \WObj:=DefaultFrame;
MoveJ [[3320.70,857.81,1040.68],[-0.7071,0.0000,0.7071,0.0000],[0,0,0,0],[3320.70,9E9,9E9,9E9,9E9,9E9]]\ID:=9,DefaultSpeed,fine,DefaultTool \WObj:=DefaultFrame;
MoveJ [[3650.66,909.48,1040.68],[-0.7071,0.0000,0.7071,0.0000],[0,0,0,0],[3650.66,9E9,9E9,9E9,9E9,9E9]]\ID:=10,DefaultSpeed,fine,DefaultTool \WObj:=DefaultFrame;
SyncMoveOff sync2;
ENDPROC
ENDMODULE