#!/bin/bash
#SBATCH -A ACD110018
#SBATCH -J profiling-example-2
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH -p ctest

module load compiler/intel/2020u4 IntelMPI/2020

MPIEXEC="/opt/ohpc/twcc/intel/2020/update1/compilers_and_libraries_2020.1.217/linux/mpi/intel64/bin/mpiexec"
PROJECT="$HOME/nbody-demo/ver1"

source /opt/ohpc/Taiwania3/pkg/intel/2020/vtune_profiler/amplxe-vars.sh
source /opt/ohpc/Taiwania3/pkg/intel/2020/advisor/advixe-vars.sh

advixe-cl --collect=roofline,survey,tripcounts -flop --project-dir=$PROJECT -- ./nbody.x 2000 500
advixe-cl --report=roofline,survey,tripcounts --project-dir=$PROJECT
