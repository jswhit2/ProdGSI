#!/bin/ksh

#BSUB -o gdas_verfrad.o%J
#BSUB -e gdas_verfrad.o%J
#BSUB -J gdas_verfrad
#BSUB -q dev_shared
#BSUB -n 1
#BSUB -R affinity[core]
#BSUB -M 5000
#BSUB -W 00:20
#BSUB -P GFS-T2O

set -x

#export PDATE=2018091706	    	# binary radstat
#export PDATE=2018110206		   # netcdf radstat
export PDATE=2019062900 		   # netcdf radstat

#############################################################
# Specify whether the run is production or development
#############################################################
export PDY=`echo $PDATE | cut -c1-8`
export cyc=`echo $PDATE | cut -c9-10`
export job=gdas_verfrad.${cyc}
export pid=${pid:-$$}
export jobid=${job}.${pid}
export envir=para
#export DATAROOT=/gpfs/dell2/emc/modeling/noscrub/${LOGNAME}/test_data
export DATAROOT=/gpfs/dell3/ptmp/emc.glopara/ROTDIRS/v16rt0
export COMROOT=/gpfs/dell2/ptmp/$LOGNAME/com

if [[ ! -d ${COMROOT}/logs/jlogfiles ]]; then
   mkdir -p ${COMROOT}/logs/jlogfiles
fi


#############################################################
# Specify versions
#############################################################
export gdas_ver=v15.0.0
export global_shared_ver=v15.0.0
export gdas_radmon_ver=v3.0.0
export radmon_shared_ver=v3.0.0


#############################################################
# Load modules
#############################################################
. /usrx/local/prod/lmod/lmod/init/profile

module load lsf/10.1
module load ips/18.0.1.163
module load impi/18.0.1
module load prod_util/1.1.0
module load grib_util/1.1.0
module load util_shared/1.1.0

module list


#############################################################
# WCOSS environment settings
#############################################################
export POE=YES


#############################################################
# Set user specific variables
#############################################################
export RADMON_SUFFIX=run2netcdf
export DATA=/gpfs/dell2/stmp/Edward.Safford/${RADMON_SUFFIX}		# rename this to WORKDIR

export NWTEST=/gpfs/dell2/emc/modeling/noscrub/Edward.Safford/ProdGSI/util/Radiance_Monitor/nwprod

export HOMEgdas=${NWTEST}/gdas_radmon.${gdas_radmon_ver}
export HOMEgfs=${HOMEgdas}
export FIXgdas=${FIXgdas:-$HOMEgfs/fix}

export JOBGLOBAL=${HOMEgdas}/jobs
export HOMEradmon=${NWTEST}/radmon_shared.${radmon_shared_ver}
export COM_IN=${DATAROOT}
export TANKverf=${COMROOT}/${RADMON_SUFFIX}

export parm_file=${HOMEgdas}/parm/gdas_radmon.parm

#############################################################
# Execute job
#############################################################
$JOBGLOBAL/JGDAS_VERFRAD

exit

