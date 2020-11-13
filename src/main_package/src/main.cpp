#include <stdio.h>
#include <iostream>
#include "ros/ros.h"
#include "turtlesim/Pose.h"
#include "geometry_msgs/Twist.h"
#include <math.h>
#include <sstream>
#include "custom_messages/Play.h"

using namespace std;

ros::Publisher velocity_publisher;
ros::Publisher play_pub;
ros::Subscriber pose_subscriber;
turtlesim::Pose turtlesim_pose;
turtlesim::Pose home_pose;
	
turtlesim::Pose user_pose;
	
turtlesim::Pose play_pose;
turtlesim::Pose goal_pose;

const double PI = 3.14159265359;

bool haveEnergy=true;
bool isRandom=true;
bool insideWall;
int energy;

void tour(turtlesim::Pose goal_pose);
bool checkWall(turtlesim::Pose goal_pose);
void move(double speed, double distance, bool isForward);
void rotate(double angular_speed, double angle, bool cloclwise);
double degrees2radians(double angle_in_degrees);		
double setDesiredOrientation(double desired_angle_radians);	//this will rotate the turtle at an absolute angle, whatever its current angle is
void moveGoal(turtlesim::Pose goal_pose, double distance_tolerance);	//this will move robot to goal
double getDistance(double x1, double y1, double x2, double y2);
void updatePose(const turtlesim::Pose::ConstPtr & pose_message);
bool playCallBack(custom_messages::Play::Request& req, custom_messages::Play::Response& res);

int main(int argc, char **argv){

	ros::init(argc, argv, "turtlesim_cleaner");
	ros::NodeHandle nh;
	double speed, angular_speed;
	double distance, angle;
	bool isForward, clockwise;


	velocity_publisher = nh.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 1000);
	ros::ServiceServer server = nh.advertiseService("/play",playCallBack);

	pose_subscriber = nh.subscribe("/turtle1/pose", 10, updatePose);	//call poseCallback everytime the turtle pose msg is published over the /turtle1/pose topic.
	
	ros::Rate loop_rate(0.5);

	//	/turtle1/cmd_vel is the Topic name
	//	/geometry_msgs::Twist is the msg type 
	ROS_INFO("\n\n\n ********START TESTING*********\n");

	while(isRandom){

		srand(time(NULL));
		energy = (rand()%10)+1;
		printf("energy: %d\n",energy);
			
		if(energy>4){
			tour(goal_pose);
			ros::Duration(5).sleep();
		}
		else{
			
			home_pose.x = 9;
			home_pose.y = 9;
			printf("So tired! \n");
			ros::Duration(2).sleep();
			moveGoal(home_pose,0.01);
			int wait = (rand()%10)+1;
			ros::Duration(wait).sleep();		
		}
	}

	loop_rate.sleep();	
	ros::spin();
	return 0;
}

bool checkWall(turtlesim::Pose goal_pose){
	if(0<goal_pose.x && goal_pose.x<11 && 0<goal_pose.y && goal_pose.y<11)
		return true;
	else
		return false;
}

void tour(turtlesim::Pose goal_pose){
	
	int wait = (rand()%4)+3;

	goal_pose.x = (rand()%10)+1;
	goal_pose.y = (rand()%10)+1;

	moveGoal(goal_pose,0.01);
	ros::Duration(wait).sleep();
}

bool playCallBack(custom_messages::Play::Request& req, custom_messages::Play::Response& res){
	
	user_pose.x = 9;
	user_pose.y = 1;
	moveGoal(user_pose,0.01);
	play_pose.x = req.play_pose_x;
	play_pose.y = req.play_pose_y;

	if (checkWall(play_pose)==true){
		moveGoal(play_pose,0.01);
	}
		
	else{printf("INVALID \n");}
	return true;
}

void updatePose(const turtlesim::Pose::ConstPtr& pose_message){
	turtlesim_pose.x=pose_message->x;
	turtlesim_pose.y=pose_message->y;
	turtlesim_pose.theta=pose_message->theta;
}

void move(double speed, double distance, bool isForward){
	geometry_msgs::Twist vel_msg;
   //set a random linear velocity in the x-axis
   if (isForward)
	   vel_msg.linear.x =abs(speed);
   else
	   vel_msg.linear.x =-abs(speed);
   vel_msg.linear.y =0;
   vel_msg.linear.z =0;
   //set a random angular velocity in the y-axis
   vel_msg.angular.x = 0;
   vel_msg.angular.y = 0;
   vel_msg.angular.z =0;

   double t0 = ros::Time::now().toSec();
   double current_distance = 0.0;
   ros::Rate loop_rate(100);
   
   do{
	   velocity_publisher.publish(vel_msg);
	   double t1 = ros::Time::now().toSec();
	   current_distance = speed * (t1-t0);
	   ros::spinOnce();
	   loop_rate.sleep();

   }while(current_distance<distance);
   	vel_msg.linear.x =0;
   	velocity_publisher.publish(vel_msg);

}



void rotate (double angular_speed, double relative_angle, bool clockwise){

	geometry_msgs::Twist vel_msg;
	   //set a random linear velocity in the x-axis
	   vel_msg.linear.x =0;
	   vel_msg.linear.y =0;
	   vel_msg.linear.z =0;
	   //set a random angular velocity in the y-axis
	   vel_msg.angular.x = 0;
	   vel_msg.angular.y = 0;
	   if (clockwise)
	   	vel_msg.angular.z =-abs(angular_speed);
	   else
	   	vel_msg.angular.z =abs(angular_speed);

	   double t0 = ros::Time::now().toSec();
	   double current_angle = 0.0;
	   ros::Rate loop_rate(1000);
	   do{
		   velocity_publisher.publish(vel_msg);
		   double t1 = ros::Time::now().toSec();
		   current_angle = angular_speed * (t1-t0);
		   ros::spinOnce();
		   loop_rate.sleep();
		   //cout<<(t1-t0)<<", "<<current_angle <<", "<<relative_angle<<endl;
	   }while(current_angle<relative_angle);
	   vel_msg.angular.z =0;
	   velocity_publisher.publish(vel_msg);
}

double degrees2radians(double angle_in_degrees){
	return angle_in_degrees *PI /180.0;
}

double setDesiredOrientation(double desired_angle_radians)
{	
	double relative_angle_radians = desired_angle_radians - turtlesim_pose.theta;
	//if we want to turn at a perticular orientation, we subtract the current orientation from it
	bool clockwise = ((relative_angle_radians<0)?true:false);
	//cout<<desired_angle_radians <<","<<turtlesim_pose.theta<<","<<relative_angle_radians<<","<<clockwise<<endl;
	rotate (abs(relative_angle_radians), abs(relative_angle_radians), clockwise);
}

void moveGoal(turtlesim::Pose goal_pose, double distance_tolerance){
	//We implement a Proportional Controller. We need to go from (x,y) to (x',y'). Then, linear velocity v' = K ((x'-x)^2 + (y'-y)^2)^0.5 where K is the constant and ((x'-x)^2 + (y'-y)^2)^0.5 is the Euclidian distance. The steering angle theta = tan^-1(y'-y)/(x'-x) is the angle between these 2 points.
	geometry_msgs::Twist vel_msg;

	ros::Rate loop_rate(10);
	do{
		//linear velocity 
		vel_msg.linear.x = 1.5*getDistance(turtlesim_pose.x, turtlesim_pose.y, goal_pose.x, goal_pose.y);
		vel_msg.linear.y = 0;
		vel_msg.linear.z = 0;
		//angular velocity
		vel_msg.angular.x = 0;
		vel_msg.angular.y = 0;
		vel_msg.angular.z = 4*(atan2(goal_pose.y - turtlesim_pose.y, goal_pose.x - turtlesim_pose.x)-turtlesim_pose.theta);

		
		velocity_publisher.publish(vel_msg);
		ros::spinOnce();
		loop_rate.sleep();

	}while(getDistance(turtlesim_pose.x, turtlesim_pose.y, goal_pose.x, goal_pose.y)>distance_tolerance);
	cout<<"at there!"<<endl;
	vel_msg.linear.x = 0;
	vel_msg.angular.z = 0;
	velocity_publisher.publish(vel_msg);

}

double getDistance(double x1, double y1, double x2, double y2){
	return sqrt(pow((x2-x1),2) + pow((y2-y1),2));
}

















