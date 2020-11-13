# Experimental Robotics Laboratory - Assignment 1
This assignment was made for the subject Experimental Robotics Laboratory at University of Genoa, Italy.

| Author Name | ID |  Email Address   |
| ------ | ------ | -----|
| Mohamed Alaaeldin | 4844271 | mohammed.eldin.88@hotmail.com |

# Assignment Description:

The turtlesim that exist in ROS was used to implement this assignment and it has energy that moves control its three modes:

 - Normal mode, where the turtle keeps moving randomly, as long as it's energy ```ENERGY >2```.
 - The relaxing (being tired) mode, where the turtle being tired and wants to rest at a specific point (home) when it's energy is```ENERGY <=2```.
 - A play mode, where the user can play with the turtle by giving a specific point that the turtle can go to. For this action, we use a customized service called ```/play```, and we can call it by ```rosservice call /play```

# FInite State Machine:

![Finite State Machine](https://user-images.githubusercontent.com/25705086/99105085-935f3f80-25ea-11eb-8672-5e5f76788585.png)

# Software Architecture: 

![EXP_ARCH](https://user-images.githubusercontent.com/23742278/98977559-65fa8f00-2521-11eb-93e2-476f325821b5.png)

# How to Install:

Fisrt you have to clone this reposiroty into your src folder by doing the following:
```sh
$ cd ~/your_workspace/src
$ git clone https://github.com/mohammed-eldin/EXP1
$ cd ..
$ catkin_make
```
After we ```catkin_make ``` we have to source the path in the bash file, if not already, by adding the following line in the bash file:
``` source ~/EXP1/devel/setup.bash ```
Then you have to bring the turtle simulation to life by:
```sh
$roscore 
$rosrun turtlesim turtlesim_node
```
Now the core and the simulation is running.

After we run the simulation, we want to run our program to the simulation by:
```sh
$rosrun main_package main
```
When the main_package is running, the turtle is being in the normal mode, and when it gets tired, it moves to a fixed point where it rests for a bit of a time.

To start giving order to the turtle to move (Play mode) we run this ros service call:

```sh
$rosservice call /play "argument"
```
in "agument", you should put two values betweet 1-10 for Example: 
```sh
$rosservice call /play 2 4
```
this will make the robot move to these coordinates.


# Function Explanation

- ```void tour(turtlesim::Pose goal_pose);``` For moving node randomly on 2D map on normal behaviour.
- ```bool checkWall(turtlesim::Pose goal_pose);``` For hecking if next point is inside of the map.
- ```void move(double speed, double distance, bool isForward);``` For checking next point if isForward and move node at linear.x direction.
- ```void rotate(double angular_speed, double angle, bool cloclwise);``` For checking and determining angular.z direction.
- ```double degrees2radians(double angle_in_degrees);``` For calculating radian from degree.
- ```double setDesiredOrientation(double desired_angle_radians);``` For understanding desired orientation.
- ```void moveGoal(turtlesim::Pose goal_pose, double distance_tolerance);``` //this will move robot to goal For moving turtlesim_node to specific location.
- ```double getDistance(double x1, double y1, double x2, double y2);``` For calculating distance between current and next location.
- ```void updatePose(const turtlesim::Pose::ConstPtr & pose_message);``` For calling when initializing subscriber.
- ```bool playCallBack(custom_messages::Play::Request& req, custom_messages::Play::Response& res);``` For calling when initializing rosService server.
