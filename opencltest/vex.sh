g++ -o vex vex.cpp -std=c++11 -I../vexcl -lOpenCL -lboost_system
export VEXCL_SHOW_KERNELS=1
./vex
