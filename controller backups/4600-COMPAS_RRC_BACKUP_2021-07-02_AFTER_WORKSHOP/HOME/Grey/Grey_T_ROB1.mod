MODULE Grey_T_ROB1
VAR confdata conf := [0,0,0,0];
VAR syncident sync1;
VAR syncident sync2;
TASK PERS tasks all_tasks{2} := [["T_ROB1"], ["T_ROB2"]];
PERS tooldata DefaultGHTool:=[TRUE,[[0.000,0.000,0.000],[1.0000,0.0000,0.0000,0.0000]],[0.001,[0.000,0.000,0.001],[1,0,0,0],0,0,0]];
TASK PERS wobjdata DefaultFrame:=[FALSE,TRUE,"",[[0.000,0.000,0.000],[1.0000,0.0000,0.0000,0.0000]],[[0,0,0],[1,0,0,0]]];
TASK PERS speeddata Speed000:=[100.00,180.00,5000.00,1080.00];
TASK PERS speeddata Speed001:=[100.00,180.00,5000.00,1080.00];
PROC Main()
ConfL \Off;
SyncMoveOn sync1, all_tasks;
MoveAbsJ [[82.467,-17.016,48.414,85.948,96.306,-31.779],[3399.99,9E9,9E9,9E9,9E9,9E9]]\ID:=0,Speed000,fine,DefaultGHTool;
MoveJ [[613.91,2326.15,1040.68],[0.5000,0.5000,0.5000,0.5000],[0,0,-2,0],[3079.80,9E9,9E9,9E9,9E9,9E9]]\ID:=1,Speed000,fine,DefaultGHTool \WObj:=DefaultFrame;
MoveJ [[943.83,2265.39,1040.68],[0.5000,0.5000,0.5000,0.5000],[0,0,-2,0],[2749.92,9E9,9E9,9E9,9E9,9E9]]\ID:=2,Speed000,fine,DefaultGHTool \WObj:=DefaultFrame;
MoveJ [[1277.75,2232.30,1040.68],[0.5000,0.5000,0.5000,0.5000],[0,0,-2,0],[2416.03,9E9,9E9,9E9,9E9,9E9]]\ID:=3,Speed000,fine,DefaultGHTool \WObj:=DefaultFrame;
MoveJ [[1613.02,2217.65,1040.68],[0.5000,0.5000,0.5000,0.5000],[0,0,-2,0],[2080.77,9E9,9E9,9E9,9E9,9E9]]\ID:=4,Speed000,fine,DefaultGHTool \WObj:=DefaultFrame;
MoveJ [[1948.61,2213.90,1040.68],[0.5000,0.5000,0.5000,0.5000],[0,0,-2,0],[1745.19,9E9,9E9,9E9,9E9,9E9]]\ID:=5,Speed000,fine,DefaultGHTool \WObj:=DefaultFrame;
MoveJ [[2284.22,2214.48,1040.68],[0.5000,0.5000,0.5000,0.5000],[0,0,-2,0],[1409.58,9E9,9E9,9E9,9E9,9E9]]\ID:=6,Speed000,fine,DefaultGHTool \WObj:=DefaultFrame;
MoveJ [[2619.83,2213.18,1040.68],[0.5000,0.5000,0.5000,0.5000],[0,0,-2,0],[1073.97,9E9,9E9,9E9,9E9,9E9]]\ID:=7,Speed000,fine,DefaultGHTool \WObj:=DefaultFrame;
MoveJ [[2955.28,2203.30,1040.68],[0.5000,0.5000,0.5000,0.5000],[0,0,-2,0],[738.53,9E9,9E9,9E9,9E9,9E9]]\ID:=8,Speed000,fine,DefaultGHTool \WObj:=DefaultFrame;
MoveJ [[3289.80,2176.94,1040.68],[0.5000,0.5000,0.5000,0.5000],[0,0,-2,0],[404.03,9E9,9E9,9E9,9E9,9E9]]\ID:=9,Speed000,fine,DefaultGHTool \WObj:=DefaultFrame;
MoveJ [[3621.06,2123.87,1040.68],[0.5000,0.5000,0.5000,0.5000],[0,0,-2,0],[72.81,9E9,9E9,9E9,9E9,9E9]]\ID:=10,Speed000,fine,DefaultGHTool \WObj:=DefaultFrame;
SyncMoveOff sync2;
ENDPROC
ENDMODULE