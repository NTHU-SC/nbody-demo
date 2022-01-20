#!/bin/bash
#SBATCH -A ACD110018
#SBATCH -J profiling-example-3
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH -p ctest

module load compiler/intel/2020u4 IntelMPI/2020

MPIEXEC="/opt/ohpc/twcc/intel/2020/update1/compilers_and_libraries_2020.1.217/linux/mpi/intel64/bin/mpiexec"
PROJECT="$HOME/nbody-demo/ver7"

source /opt/ohpc/Taiwania3/pkg/intel/2020/vtune_profiler/amplxe-vars.sh
source /opt/ohpc/Taiwania3/pkg/intel/2020/advisor/advixe-vars.sh
source /opt/ohpc/Taiwania3/pkg/intel/2020/vtune_profiler/vtune-vars.sh

vtune -collect hotspot -result-dir $PROJECT/vtune-output ./nbody.x 2000 500
