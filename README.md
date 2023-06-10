<div align="center">

# Padavan-Luna

**Collection of various patches and configurations for [padavan-ng](https://gitlab.com/hadzhioglu/padavan-ng) firmware.**

*[Luna art](https://www.deviantart.com/ragerer/art/Princess-Luna-Smiling-Winky-Face-467319378) by [RAGErER](https://www.deviantart.com/ragerer)*

![Luna Web UI](media/luna_webui.gif)

</div>

# Patches
To install a patch get it from `patches` directory and apply using `patch` or `git patch` tool to [Padavan repository](https://gitlab.com/hadzhioglu/padavan-ng). If patch needs to replace files, copy them to the root of repository.

| Patch                                              | Purpose                                                               | Replaces files? |
|----------------------------------------------------|-----------------------------------------------------------------------|-----------------|
| [Banner](patches/banner.patch)                     | Replaces banner printed upon SSH login                                | Y               |
| [ls lh](patches/ls_lh.patch)                       | Aliases ls to ls -lh by default                                       | N               |
| [Menuconfig](patches/menuconfig.patch)             | Adds support for menuconfig in Makefile (executes on build)           | N               |
| [Fast compilation](patches/fast_compilation.patch) | Decreases compilation time by evaluating constant variables only once | N               |
| [Strip CSS](patches/strip_css.patch)               | Strips down main.css by removing deprecated rules                     | N               |
| [WWW](patches/www.patch)                           | Adds custom theme to Web UI                                           | Y               |

# Configurations
[Sample config files](configs) that can be loaded using [menuconfig patch](patches/menuconfig.patch) on build.

### Kernel
```toml
CONFIG_NO_HZ=y
CONFIG_DEFAULT_HOSTNAME=luna
CONFIG_BUG=n
CONFIG_PCI_QUIRKS=n
CONFIG_SLAB=n
CONFIG_SLUB=y
CONFIG_NET_PPPOE_PTHROUGH=n
CONFIG_BLK_DEV_LOOP=n
CONFIG_SQUASHFS_4K_DEVBLK_SIZE=y
```

### Busybox
```toml
CONFIG_CHROOT=n
CONFIG_DOS2UNIX=n
CONFIG_UNIX2DOS=n
CONFIG_UNAME_OSNAME=GNU/Ponix
CONFIG_VI=n
CONFIG_CHPASSWD=n
CONFIG_FLOCK=n
CONFIG_SWITCH_ROOT=n
CONFIG_FEATURE_MOUNT_LOOP=n
CONFIG_CROND=n
CONFIG_CRONTAB=n
CONFIG_STRINGS=n
CONFIG_DNSDOMAINNAME=n
CONFIG_INETD=n
```

### Toolchain
```toml
CT_STRIP_TARGET_TOOLCHAIN_EXECUTABLES=y
CT_EXTRA_CFLAGS_FOR_BUILD="-O3"
CT_EXTRA_LDFLAGS_FOR_BUILD="-O3"
CT_TARGET_CFLAGS="-pipe -O3"
CT_ARCH_TUNE=""
CT_ARCH_ARCH="" # Set to your target arch manually
CT_CC_GCC_ENABLE_TARGET_OPTSPACE=n
```

# Compiler extra flags
It is possible to add compiler flags for the entire build by wrapping toolchain binaries in script and hardlinking them.

### How to install
1. Build the toolchain
2. Move original binaries from `toolchain/out/bin` to `toolchain/out/bin_original`
3. Copy `wrapper.sh` and `setup_hardlinks.sh` to `toolchain/out/bin`
4. Execute `setup_hardlinks.sh`
5. Edit compiler and linker flags (`-O3` by default) in `wrapper.sh` to suit your needs

# Expanding further
There are more changes that could have been done, but they failed to apply.
See [here](FAILED_MODIFICATIONS.md)

# Contributing
All issues and pull requests are welcome! Feel free to open an issue if you've got an idea or a problem. You can open a pull request if you are able to implement it yourself.

---
<p align="center">
<sub><strong>
    Made with ponies and love!
    <br/>
    GNU GPL © Ryze 2023
</strong></sub>
</p>
