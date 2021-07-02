MODULE A009_Motion_Procs_1


    PROC pick_rod_from_feed()

        VAR robtarget cpose1;
        VAR robtarget cpose2;

        !set_speed;
        SingArea\Wrist;
        ConfL\Off;
        PathAccLim TRUE\AccMax:=acc_max,TRUE\DecelMax:=dec_max;

        open_gripper;
        cpose1:=current_pos;
        MoveL RelTool(current_pos,0,0,-200),current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=current_wobj_r1;
        MoveL current_pos,current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=current_wobj_r1;
        WaitTime(2);
        close_gripper;
        cpose1.trans.z:=cpose1.trans.z+500;
        WaitTime 0.5;
        MoveL cpose1,current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=current_wobj_r1;
        MoveL RelTool(cpose1,0,0,0,\Rz:=60),current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=current_wobj_r1;


        send_command_executed;

    ENDPROC

    PROC mill_rod_start()


        VAR robtarget cpose1;
        TPWrite "Pose start mill "+ValToStr(current_pos.trans.z);
        cpose1:=current_pos;

        ConfL\Off;
        MoveL current_pos,current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=current_wobj_r1;

        WaitTime(2);

        send_command_executed;

    ENDPROC

    PROC mill_rod_end()

        VAR robtarget cpose1;
        VAR speeddata speed1:=[0.7,1,0.7,1];
        VAR robtarget cpose2;

        TPWrite "Pose end mill "+ValToStr(current_pos.trans.z);

        ConfL\Off;
        MoveL current_pos,speed1,current_zone_data_r1,current_tool_r1,\WObj:=current_wobj_r1;

        MoveL RelTool(current_pos,0,-10,0),current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=current_wobj_r1;

        cpose1:=current_pos;
        cpose1.trans.z:=current_pos.trans.z+600;

        MoveL cpose1,current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=current_wobj_r1;
        cpose2:=cpose1;
        cpose2.trans.y:=cpose2.trans.y+500;
        MoveL cpose2,current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=current_wobj_r1;

        send_command_executed;

    ENDPROC


    PROC open_gripper()
        
        WaitRob\InPos;
        !rGr3Open;
        SetDO DO_1, 0;
        WaitTime 0.5;
        WaitRob\InPos;
        !SetDO DO10_1, 1;
        !WaitTime 0.5;
        send_command_executed;
        
    ENDPROC

    PROC close_gripper()
        
        WaitRob\InPos;
        SetDO DO_1, 1;
        WaitTime 0.5;
        WaitRob\InPos;
        !SetDO DO10_1, 0;
        !WaitTime 0.5;
        send_command_executed;
        
    ENDPROC

    PROC open_clamp()

        WaitRob\InPos;
        rClamp3Open;
        WaitRob\InPos;

    ENDPROC

    PROC close_clamp()

        WaitRob\InPos;
        rClamp3Close;
        WaitRob\InPos;

    ENDPROC

    PROC regrip_place()

        VAR robtarget cpose1;

        !WaitRob \InPos;
        !rClamp1Open;
        !WaitRob \InPos;

        ConfL\Off;
        SingArea \Wrist;

        cpose1:=current_pos;
        cpose1.trans.z:=cpose1.trans.z+150;

        MoveL RelTool(cpose1,0,-5,0),current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=current_wobj_r1;
        cpose1.trans.z:=cpose1.trans.z-150;
        MoveL cpose1,current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=current_wobj_r1;

        WaitRob\InPos;
        rClamp3Close;
        WaitRob\InPos;
        open_gripper;
        WaitRob\InPos;

        MoveL RelTool(cpose1,0,0,-300),current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=current_wobj_r1;
        send_command_executed;

    ENDPROC

    PROC regrip_pick()

        VAR robtarget cpose1;

        ConfL\Off;
        SingArea \Wrist;

        MoveL RelTool(current_pos,0,0,-300),current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=current_wobj_r1;
        MoveL current_pos,current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=current_wobj_r1;

        WaitRob\InPos;
        close_gripper;
        WaitRob\InPos;
        rClamp3Open;
        WaitRob\InPos;

        cpose1:=current_pos;
        cpose1.trans.z:=cpose1.trans.z+400;

        MoveL cpose1,current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=current_wobj_r1;
        send_command_executed;

    ENDPROC

    PROC move_to_safe_pos()

        ConfJ \Off;
        PathAccLim TRUE\AccMax:=acc_max,TRUE\DecelMax:=dec_max;

        IF BUFFER_LENGTH_R3>1 THEN
            MoveAbsJ current_jointpos,current_speed_data_r1,current_zone_data_r1,tool0;
        ELSE
            MoveAbsJ current_jointpos,current_speed_data_r1,fine,tool0;
        ENDIF

    ENDPROC


    PROC pick_up_brick_from_pose()
        VAR bool dist;
        VAR bool vacuum;

        VAR robtarget hit_dist;
        VAR robtarget hit_vac;

        !drive to brickpose + 50 in z
        current_pos.trans.z:=current_pos.trans.z+100;
        MoveL current_pos,current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=wobj0;

        !drive down until distance sensor kicks in
        current_pos.trans.z:=current_pos.trans.z-100;
        !SearchL \PStop,DI_DISTANCE,hit_dist,current_pos,v10,current_tool;

        hit_dist.trans.z:=hit_dist.trans.z-18;

        !turn on vakuum pump
        !SetDO DO_VACPUMP,1;
        WaitTime 2;
        !SetDO DO_VALVE2,1;

        !drive down until vacuum sensor kicks in
        !SearchL \PStop,DI_VACUUM,hit_vac,hit_dist,v10,current_tool;

        current_pos.trans.z:=current_pos.trans.z+200;

        IF BUFFER_LENGTH_R3>1 THEN
            MoveLSync current_pos,current_speed_data_r1,current_zone_data_r1,current_tool_r1,\WObj:=wobj0,"send_command_executed";
        ELSE
            MoveL current_pos,current_speed_data_r1,fine,current_tool_r1,\WObj:=wobj0;
            send_command_executed;
        ENDIF
    ENDPROC


ENDMODULE