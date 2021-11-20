## Synap Workstation Setup

Can be used to quickly bootstrap a new workstation.

### How to - Mac OS

1. Clone the repository (or copy the repository onto a memory-stick).
2. Open up `Terminal.app`
3. CD into the cloned repository folder
4. Execute: `./setup.sh` to install all commonly used tools
  - You may also peer into the `opt-in` folder to see what optional tools you wish to install
  - Example of how to install optional tools along with the common setup: `./setup.sh python terraform`
5. Enter your administrator user password (for sudo scripts)
6. You may need to re-run the setup if it fails half-way as sometimes file permissions need to be adjusted - the script will explain the steps should we run into that issue


### Limitations

- Currently only Mac OS is supported.
- You can only run this within an administrator user profile on Mac OS.
- You can re-run this script multiple times, or even on your existing workstation, however be aware that some of your settings may be overriden.
- This setup intends to reduce the time taken to setup a new workstation, not to maintain a uniform and up-to-date environment. You will need to update the various development tools and libraries (such as Node.js) independently as required.
- Only tools are installed and in some cases, lightly configured, but no authentication steps are performed. For example, you will have to authenticate your Github CLI manually.