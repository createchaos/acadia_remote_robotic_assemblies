"""Example: Apply transformation to a shape and view in Rhino.
"""
from compas.geometry import Frame
from compas.geometry import Box
from compas.geometry import Rotation
from compas.geometry import Translation
from compas_rhino.artists import FrameArtist
from compas_rhino.artists import BoxArtist

# Box in the world coordinate system
frame = Frame([1, 0, 0], [-0.45, 0.1, 0.3], [1, 0, 0])
width, length, height = 1, 1, 1
box = Box(frame, width, length, height)

R = Rotation.from_axis_and_angle((0.917, 0.392, -0.079), 0.535)
T = Translation.from_vector((2.0, 2.0, 2.0))

# Apply transformation on box.
box_transformed = box.transformed(T * R)
print("Box frame transformed", box_transformed.frame)

# create artists
artist1 = BoxArtist(box)
artist2 = BoxArtist(box_transformed)

# draw
artist1.draw()
artist2.draw()
