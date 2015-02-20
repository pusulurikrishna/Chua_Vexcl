export PATH=/usr/local/cuda-6.5/bin:$PATH
export VEXCL_SHOW_KERNELS=1

#echo Running chua1
#time lorenz_vexclinstall/chua_sweep1 --tmax=1e4 --a_min=-10 --a_max=-0.5 --a_steps=100 --b_min=0 --b_max=10 --b_steps=100 --kmax=25 --out=tingli_data/chua1.h5
#echo Running chua2
#time lorenz_vexclinstall/chua_sweep2 --tmax=1e4 --a_min=0.017 --a_max=0.027 --a_steps=1000 --b_min=0.93 --b_max=0.98 --b_steps=1000 --kmax=25 --out=tingli_data/chua2.h5
#echo Running chua3
#time lorenz_vexclinstall/chua_sweep3 --tmax=1e4 --a_min=0.016 --a_max=0.018 --a_steps=1000 --b_min=0.9484 --b_max=0.9495 --b_steps=1000 --kmax=25 --out=tingli_data/chua3.h5
#echo Running chua4
#time lorenz_vexclinstall/chua_sweep4 --tmax=1e4 --a_min=0.016 --a_max=0.021 --a_steps=1000 --b_min=0.946 --b_max=0.952 --b_steps=1000 --kmax=25 --out=tingli_data/chua4.h5
#echo Running chua5_1
#time lorenz_vexclinstall/chua_sweep5_1 --tmax=1e4 --a_min=0 --a_max=8 --a_steps=1000 --b_min=0 --b_max=8 --b_steps=1000 --kmax=25 --out=tingli_data/chua5_1.h5
#echo Running chua5_2
#time lorenz_vexclinstall/chua_sweep5_2 --tmax=1e4 --a_min=0.8 --a_max=1.1 --a_steps=1000 --b_min=0 --b_max=15 --b_steps=1000 --kmax=25 --out=tingli_data/chua5_2.h5



echo Running chua2
time lorenz_vexclinstall/chua_sweep2 --tmax=1e4 --a_min=0.020 --a_max=0.029 --a_steps=5000 --b_min=0.925 --b_max=0.970 --b_steps=5000 --kmax=25 --out=tingli_new_data/chua21_5000.h5
#echo Running chua4
#time lorenz_vexclinstall/chua_sweep4 --tmax=1e4 --a_min=0.018 --a_max=0.021 --a_steps=5000 --b_min=0.942 --b_max=0.952 --b_steps=5000 --kmax=25 --out=tingli_new_data/chua4_5000.h5
#lorenz_vexcl/plot_kneading_highres -f tingli_new_data/chua2.h5 -o tingli_new_data/chua29 -b 10 -e 24 -l 100
#lorenz_vexcl/plot_kneading_highres -f tingli_new_data/chua4.h5 -o tingli_new_data/chua49 -b 10 -e 24 -l 100

