# Workstation Setup

This project automates the process of setting up a new Pivotal Labs machine.

**Warning: the automation script is currently aggressive about what it does and will overwrite vim configurations, bash-it configurations, etc.**

## Getting Started

- Update to El Capitan
- Install [Xcode from the App Store](https://itunes.apple.com/us/app/xcode/id497799835)

```sh
$ cd workspace
$ git clone https://github.com/pivotal/workstation-setup.git
$ cd workstation-setup
$ ./script/setup.sh
```

## Customizing

If you'd like to customize this project for your own use:

- Fork the project
- Edit `./scripts/setup.sh` to you liking
- Profit
