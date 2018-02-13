# ovftool
Container for running VMware's ovftool.

## Building
* Download the linux ovftool installer and place it in the same directory as the Dockerfile. VMware's license wall prevents the build from doing this itself.
* The Dockerfile defaults to `VMware-ovftool*` as the name of the ovftool installer. If you have more than one in the working directory, the first one will be installed. If your filename does not match this, or for some other reason you want to explicitly set the installer to use, then use a build arg to set the name of the file. 

```--build-arg OVFTOOL=VMware-ovftool-X.Y.Z-1234567-lin.x86_64.bundle```

* Build the container in the standard way, optionally using the build-arg if you need:

```docker build -t ovftool .```

## Usage
The dockerfile has an ENTRYPOINT set to be ovftool, so run the container as if you were running the executable itself. You will probably find it convenient to mount your home directory into the container so you have access to the files it creates.

For example, to export an OVA of a VM from vSphere:

```docker run -it --rm -v /home/$(whoami):/root/home -w /root/home ovftool vi://username:pass@vcenter.hostnameorip/Datacenter/vm/vmname vmname.ova```

VMware's OVF Tool documenation can be found here:
https://www.vmware.com/support/developer/ovf/ovf420/ovftool-420-userguide.pdf
