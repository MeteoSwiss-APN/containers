#

usage(){
echo "Usage: prepare_container.sh [-c] [-g]"
exit 1
}


ARCH=""
while getopts ":cg" opt; do
  case ${opt} in
    c ) # process cpu
      ARCH="CPU"
      ;;
    g ) # process gpu
      ARCH="GPU"
      ;;
    \? ) usage
      ;;
  esac
done

if [[ ${ARCH} == "" ]]; then
  usage
fi

workdir=$PWD
git clone --branch docker git@github.com:cosunae/cosmo-pompa.git
cd cosmo-pompa
git clone git@github.com:MeteoSwiss-APN/stella.git
cd $workdir

git clone git@github.com:C2SM-RCM/libgrib1.git
git clone --branch libgrib_api_1.20.0.2 git@github.com:C2SM-RCM/libgrib-api-vendor.git libgrib-api
cd libgrib-api
git clone --branch v1.20.0.2 git@github.com:C2SM-RCM/libgrib-api-cosmo-resources.git cosmo_definitions
cd $workdir
git clone git@github.com:C2SM-RCM/libjasper.git

if [[ "${ARCH}" == "GPU" ]]; then
  cp Dockerfile_gpu Dockerfile
else
  cp Dockerfile_cpu Dockerfile
fi

