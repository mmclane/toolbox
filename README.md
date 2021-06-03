# Matt's Toolbox

VirtualBox is basically inception for your computer. You can use VirtualBox to run entire sandboxed operating systems within your own computer.

Vagrant is software that is used to manage a development environment. Through the command line, you can grab any available OS, install it, configure it, run it, work inside of it, shut it down, and more.

Using VirtualBox and Vagrant, you can easily setup and manage our development environment.

This was orginally something I developed while working at LLamasoft and was kinda focused on their environment and use case.  After leaving the company I still wanted to have a toolbox for myself, so I have moved things around, commented things out, and started to make changes.  This means that there is very likely out of date code and documentation.  I leave you to sort through it.

## Setup steps

See SETUP.md

## Connecting to toolbox environment

* Run vagrant up  
* Run vagrant ssh

## Switch between virtual box and docker

On windows based systems, docker requires hyper-v to be enabled.  Virtualbox requires that it be disabled.  You can use HyperVSwitch.exe (included in repo) to enable or disable hyper-v to switch between the two.  Note that it requires you to reboot.

NOTE: If you see something simular to the follwing when you run vagrant up, then you likely still have hyper-v enabled.  Try running HyperVSwitch.exe to disable it.

```text
Stderr: VBoxManage.exe: error: VMMR0_DO_NEM_INIT_VM failed: VERR_NEM_MISSING_KERNEL_API_2 (VERR_NEM_MISSING_KERNEL_API_2).
VBoxManage.exe: error: VT-x is not available (VERR_VMX_NO_VMX)
VBoxManage.exe: error: Details: code E_FAIL (0x80004005), component ConsoleWrap, interface IConsole
```

## Sharing files from your machine

In order to make various files available to our virtual machines in a consistent way, the toolbox currently syncs alocal directory ./synced.  This directory is ignored by git.  You can either put files directory in the directory or create symlinks in that directory to point to various other locations.  Note: For files on windows we need to make hardlinks (see below).  Once you have created your links and connected to the toolbox vm, you can access everything in /host.

Another good reason to do it this way is to rationalize our paths.  In our toolbox, all of our synced files will be in /host and we can start to expect that path in our scripts.

Some good things to link to in this share might include:

* A directory containing all your ssh keys named "keys"
* A directory containing your repos named "repos"
* ??

### Create a symlink on windows in shared directory

* Open a cmd prompt with administrative permissions
* Change directory to toolbox repo on your machine
* mkdir synced (if needed)
* Use the mklink command to create the link.  The following are examples
  * <https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/mklink>
  * Directory: mklink /J LinkName TargetPath
    * i.e. mklink /J repos "c:\Users\matt.mclane\repos"
  * File: mklink /H LinkName TargetPath
    * i.e. mklink /D "c:\Users\matt.mclane\repos\llamasoft\toolbox\share\test.cmd" "c:\Users\matt.mclane\repos\kube.cmd"

## Ideas for future improvements

* When creating the image in toolbox_iamges directory, I should have a single packer.json file instead of two.  When "make build-cloud" is run it should actually run a script of some sort that reads in packer.json and updates/inserts the post provisioner stuff to upload the image.  Then it actually runs packer using a temp json file that it deletes afterward.

* Should I convert this to use CentOS instead of Ubuntu?  Also, should I update to Ubuntu 20?