The data frame consists of 68 columns.  The first 2 columns identify the subject and the action being performed.  The remaining columns identify the average value taken for the specific measurement.


The next 20 columns identify average acceleration or jerk along the X-direction, Y-direction, or Z-direction, according to what the acceleration is attributed to. I believe this to be in m/sec^2 for acceleration and m/sec^3 for the jerk.

The following 13 columns identify the mean values of the FFT

Following those, there are another 20 columns that measure the average acceleration or jerk values along a specific direction if supplied (with a "...X", "...Y", or a "...Z" noting a vector in the cartesian coordinates)

The remaining columns are again average Fast Fourier Transform values.

BodyAcc-"Body Acceleration"<br>
GravityAcc-"Gravity Acceleration"<br>
BodyACCJerk-"Jerk in the Body's movement"<br>
BodyGyro-"Angular Acceleration/Jerk of the body" this would be measured in radians/sec^2 or radians/sec^3 probably

