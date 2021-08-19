import os
import math

from compas_fab.backends import RosClient
from compas_fab.robots import PlanningScene, trajectory
from compas_fab.robots import Tool

from compas.datastructures import Mesh
from compas.geometry import Frame
from compas.robots import Configuration

HERE = os.path.dirname(__file__)

# create tool from mesh and frame
mesh = Mesh.from_stl(os.path.join(HERE, 'ECL_gripper.stl'))
frame = Frame([0.0, 0.0, 0.300], [1, 0, 0], [0, 1, 0])
tool = Tool(mesh, frame, name='gripper')

with RosClient('localhost') as client:
    robot = client.load_robot()
    scene = PlanningScene(robot)


    # 1. Set tool
    robot.attach_tool(tool)
    scene.add_attached_tool()

    print(robot.info())

    # 2. Define start configuration
    start_configuration =  Configuration((1.172, 0.199, -0.306, 0.006, 3.193, 0.107, -0.052, 2.357, -0.874, 1.066, -2.467, -3.142, 1.372, 5.499), (2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0), ('A_cart_joint', 'A_joint_3', 'A_joint_2', 'A_joint_1', 'A_joint_6', 'A_joint_5', 'A_joint_4', 'B_joint_1', 'B_joint_2', 'B_cart_joint', 'B_joint_3', 'B_joint_4', 'B_joint_5', 'B_joint_6'))

    # 3. Define frames
    frame = [Frame([2.21,2.12,0.66], [0, 1, 0], [1, 0, 0])]

    # 4. Convert frames to tool0_frames
    frame_tool0 = robot.from_tcf_to_t0cf(frame)

    t_position = 0.001
    t_axes = [math.radians(1), math.radians(1), math.radians(1)]
    constraints = robot.constraints_from_frame(frame_tool0[0], group = 'robotBaxis', tolerance_position=t_position, tolerances_axes=t_axes)

    trajectory = robot.plan_motion(
        goal_constraints = constraints,
        start_configuration=start_configuration,
        group='robotBaxis',
        )

    print("Computed cartesian path with %d configurations, " % len(trajectory.points))
    print("following %d%% of requested trajectory." % (trajectory.fraction * 100))
    print("Executing this path at full speed would take approx. %.3f seconds." % trajectory.time_from_start)
