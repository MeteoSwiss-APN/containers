Build container
==================

Build GPU container as 

./prepare_container.sh -g 

Build CPU container as 

./prepare_container.sh -c

sudo docker build .

Run as
==================

sudo docker run  -v <workdir>/cosmo-pompa/cosmo//test/testsuite/data/cosmo1/test_1:/data 8f3935ca8b62 mpirun -n 2 --allow-run-as-root  cosmo
