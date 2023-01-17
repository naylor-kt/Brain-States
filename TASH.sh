#!/bin/tcsh

# Set up the TASH toolbox

chmod +x /Users/mszkcn/TASH-Brain_States/TASH.csh

#To use TASH you need to have changed the variables in two of the TASH files in the TASH folder. To do this make a copy of the TASH_master folder, and name it something relevant
# The files that need to be edited are TASH_DefineSubjects and TASH_DefineSubjects.m
# TASH_DefineSubjects on the second line of the file define the names of the subjects
#TASH_DefineSubjects.m on line 2 define the subjects ebveloped in apostrophes, on line 3 define the folder where the freesurfer subjects are, on line 4 define the folder where the TASH output images should be saved

# Define the SUBJECTS_DIR folder

setenv SUBJECTS_DIR /Users/mszkcn/BS_Test/freesurfer/subjects

#Move to the required TASH folder (whatever the copy with the edited folders was named)

cd /Users/mszkcn/TASH-Brain_States

# Run the TASH toolbox
./TASH.csh
