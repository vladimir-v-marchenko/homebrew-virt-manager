homebrew-virt-manager
=====================

[homebrew][homebrew] formula to install [`virt-manager`][virt-manager] and [`virt-viewer`][virt-viewer] on Mac OSX.

## Usage

    brew tap vladimir-v-marchenko/homebrew-virt-manager
    brew install virt-manager virt-viewer
    virt-manager -c test:///default

## FAQs

#### Why can't I connect to a remote URI?

When connecting to remote URIs, you probably need to override the `libvirt` socket location:

    virt-manager -c 'qemu+ssh://user@libvirthost/system?socket=/var/run/libvirt/libvirt-sock'
    virt-viewer -c 'qemu+ssh://user@libvirthost/system?socket=/var/run/libvirt/libvirt-sock'

#### I still can't connect to a remote URI, why?

This formula for `virt-manager` does not include the `openssh-askpass` dependency and does not prompt for passwords in a popup window. Here are two workarounds:

1. Run `virt-manager` with either the `--debug` or `--no-fork` option to get password prompt via the CLI.

2. Set up SSH keys between your local and remote system to avoid the prompt.

#### Why can't I connect to a local URI (*e.g.*, qemu:///system)?

I've not yet tested `virt-manager` against any local URIs/hypervisors. If you get `virt-manager` working with a local hypervisor and needed to take any special steps, feel free to share the details.

#### Everything was working yesterday, but it's not working today, can you help?

If `virt-manager` or its dependencies have been upgraded recently (`brew upgrade`), it's possible that a reinstall may fix the issue:

    brew uninstall --force gtk+3 libvirt-glib gtk-vnc spice-gtk libvirt pygobject3 virt-manager virt-viewer
    brew install virt-manager virt-viewer

[homebrew]: http://brew.sh/
[virt-manager]: https://virt-manager.org/
[virt-viewer]: https://virt-manager.org/
