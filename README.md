# eos-ubuntu

This script turns an EndlessOS installation into a more traditional "Ubuntu desktop".

![image](https://user-images.githubusercontent.com/1264109/199630767-21f98373-f668-4e29-a22f-dfaaea984cf9.png)

## Userspace 

Distrobox is automatically installed and the following shortcuts are set:

- Ctrl-alt-t - A Debian terminal (Latest stable release)
- Ctrl-alt-u - An Ubuntu terminal (Latest LTS)

Sometimes these shortcuts don't get set right, but you'll find both toolbox icons in your menu, I added one to your dock too. 
Use these or any other cloud image as your mutable userspace with apt and all the normal tools you'd find in a distro.

## Limitations and Gotchas

There's no such thing as deb-ostree, so you can't layer anything. 
Therefore this will only work on hardware that doesn't require anything outside of the initial image.

You might be interested in [ublue](https://github.com/castrojo/ublue) for a Fedora based approach.

## TODO

If you know a way of programatically grabbing gnome extensions and installing them easily please let me know. 

- Needs a way to work on both eOS4 and 5, right now this works on 4 only. It'd be nice to just be able to automatically grab the extension version matching the GNOME version and just figure it out.
- Sometimes the shortcuts don't get set properly for the distroboxes, but they work just fine otherwise. 

## Why?

You might be wondering why use this instead of something like Fedora Silverblue? 
Fedora is great but aggressive with updates, Ubuntu LTS is modern but not as aggressive, but doesn't offer an ostree variant.

At first I wanted to make an import of all of Ubuntu's archives and spit out an ostree-based image, but that is a ton of work. 
EndlessOS uses Ubuntu's HWE kernel with a Debian userspace, so it was much easier to just turn off their custom desktop extension and add some distrobox magic to see how well it works.
So try it!
