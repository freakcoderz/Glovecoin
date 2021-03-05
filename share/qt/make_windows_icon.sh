#!/bin/bash
# create multiresolution windows icon
ICON_DST=../../src/qt/res/icons/GLOV.ico

convert ../../src/qt/res/icons/Glovecoin-16.png ../../src/qt/res/icons/Glovecoin-32.png ../../src/qt/res/icons/Glovecoin-48.png ${ICON_DST}
