#!/bin/bash
# -----------------------------------------------------------------------
# Trivadis AG, Business Development & Support (BDS)
# Saegereistrasse 29, 8152 Glattbrugg, Switzerland
# -----------------------------------------------------------------------
# Name.......: 06_add_pdb_os_user.sh
# Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
# Editor.....: Stefan Oehrli
# Date.......: 2019.02.20
# Revision...: --
# Purpose....: Script to add a PDB OS user.
# Notes......: --
# Reference..: https://github.com/oehrlis/oudbase
# License....: Apache License Version 2.0, January 2004 as shown
#              at http://www.apache.org/licenses/
# -----------------------------------------------------------------------
# Modified...:
# see git revision history with git log for more information on changes
# -----------------------------------------------------------------------

# - Customization -------------------------------------------------------
PDB_OS_USER=orapdb
PDB_OS_PASSWD=manager
PDB_OS_GRP=restricted
# - End of Customization ------------------------------------------------

# - configure instance --------------------------------------------------
echo "Add PDB OS User:"
echo "  PDB_OS_USER         :   ${PDB_OS_USER}"
echo "  PDB_OS_GRP          :   ${PDB_OS_GRP}"

echo "Add PDB OS group ${PDB_OS_GRP}:"
groupadd restricted

echo "Add PDB OS user ${PDB_OS_USER}:"
useradd --create-home --gid restricted --shell /bin/bash orapdb

echo "Install passwd and set password for ${PDB_OS_USER}:"
yum install -y passwd
yum clean all
echo "${PDB_OS_PASSWD}" | passwd orapdb --stdin 
# - EOF -----------------------------------------------------------------
