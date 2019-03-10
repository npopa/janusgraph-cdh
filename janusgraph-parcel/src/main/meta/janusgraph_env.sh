#!/bin/bash
echo "Setting up janusgraph environment ..."
export JANUSGRAPH_DIST=$PARCELS_ROOT/$PARCEL_DIRNAME
export PARCEL_VERSION="${pom.version}"
export PARCEL_BUILT_BY="${user.name}"
export PARCEL_BUILT_DATE="${timestamp}"