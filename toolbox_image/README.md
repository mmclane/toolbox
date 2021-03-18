# toolbox image packer job

## Prereqs

- packer - Automatically create the VBox and upload to vagrant cloud
- virtualbox - Used by packer to create the vbox
- make - Make all of the commands simple and consistent. Usually pre-installed on linux and you can install it on windows (see below).

### ENV Variables

### Files for secrets

The are some secrets that need to be put in place in the docker container before you build it.  This includes the following files which should be in place as specied here.

### Make for windows installation

- Install from: http://gnuwin32.sourceforge.net/packages/make.htm
- Add 'C:\Program Files (x86)\GnuWin32\bin' to your path

## General Usage

From the toolbox_image directory you can simply run make commands to build the image 

- make validate - Run packer validate to ensure correct formatting.
- make build - Runs packer job using packer.json to build local vbox image.  This is the minimum that needs to be done before running vagrant in the root directory.
- make build-cloud - Runs packer job using packer-cloud.json to build vbox image.  This file should be the same but at the end it will upload to vagrant cloud so that it can be shared.  
- make debug - Runs build with debug flag set.
- make full - Runs validate followed by build.

## Image Versions

Its important to remember that the packer job (make build) is going to upload this to vagrant cloud.  If you don't update the version variable at the top of the packer.json file it will overwrite an existing version.  You probably want to increment that number prior to running make build each time you make a change.
