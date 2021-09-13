
MODULE A009_Motion_1

    VAR robtarget home_pos;

    PROC Main()

        ! Insert from 15.9.16pf
        !WaitSyncTask idMainA009Sta,tlAll;
        TPWrite "Program Start";

        init;

        TPWrite "Motion: Start waiting for positions in buffer and move accordingly";

        WHILE (TRUE) DO
            IF BUFFER_LENGTH_R1>0 THEN
                IF msg_lock=FALSE THEN
                    execute_from_buffer;
                ENDIF
            ENDIF
            WaitTime 0.05;
        ENDWHILE

        ! Insert from 15.9.16pf
        !WaitSyncTask idMainA009End,tlAll;
        TPWrite "Program End";

    ENDPROC

ENDMODULE