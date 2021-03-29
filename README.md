>**todo**: Use environment to specify workspace directory

# Workstation Setup

This project automates the process of setting up a new RxRevu machine using a simple [Bash](https://www.gnu.org/software/bash/) script.
It was forked from https://github.com/pivotal/workstation-setup

**Warning: this script is currently aggressive about what it does and will overwrite vim configurations, bash-it configurations, etc.**

**Note:** the primary branch for this repo is `main` rather than `master`

## Getting Started

- Run the latest version of macOS
- These scripts might work on previous versions, but are maintained with only the latest macOS in mind
- You may need to install the latest version of [Xcode](https://developer.apple.com/xcode/) before starting

Open up Terminal.app and run the following command:

```sh
mkdir -p ~/workspace &&
  cd ~/workspace &&
  git clone https://github.com/rxrevu/workstation-setup.git &&
  cd workstation-setup
```

### Development Machine

If you're setting up a development machine choose which languages and tools to install:

#### For Direct developers (remove unnecessary languages when running command)
`./setup.sh direct-dev aws ruby python docker oh-my-zsh snowflake terraform intellij`

(and possibly `rxrevu_web_app_yml_symlink`)

#### For Insights developers
`./setup.sh aws python docker oh-my-zsh snowflake terraform intellij`
(pycharm is also available as a Python specific IDE)

#### For Solutions Architects/Platform Engineers
`./setup.sh aws docker oh-my-zsh snowflake terraform lefthook`

Additional options can be installed later by running:

`./add_setup.sh <list of opt-in items to install>`

To see a list of available options run:

```sh
printf "%s " `ls scripts/opt-in | sed 's/\..*//'`; echo
```

## Having problems?

If you see errors from `brew`, try running `brew doctor` and include the diagnostic output in your issue submission.

### Installing .NET
There is a known conflict between `dotnet` and `dotnet-sdk` Homebrew formulae.
The `dotnet` formula is only the runtime, so you probably want `dotnet-sdk`, which includes the .NET runtime.
If you're seeing errors when attempting to install, run `brew uninstall dotnet`.

## Contributing

If you'd like to add programs to this script, make sure they are approved for use.
The security team maintains a [list of authorized software](https://rxrevu.atlassian.net/wiki/spaces/SEC/pages/72351752/Authorized+Software).
Before adding any software to your machine or this script, fill out a [request form](https://rxrevu.atlassian.net/wiki/spaces/PLAT/pages/93520115/Request+Forms) to have it approved.

>**todo**: is this still correct?
### Import RubyMine settings
Within RubyMine select `File`->`Import Settings...`.

Navigate to `workstation-setup/files/rm_settings.zip` and select `rm_settings.zip`.

Select all the settings and hit `Ok`, RubyMine will then prompt you to restart (it is wise to do so).

### AWS Credential Setup
**Note:** Requires staging/prod and sandbox AWS credentials
Change `aws_access_key_id`s and `aws_secret_access_key`s in 
the `~/.aws/credentials` file to use the credentials provided to
you by the security team.

### AWS MFA
Use the `mfa` command to set an MFA token for the next 12 hours.
See the usage message it prints for more information.

To set your token in a new terminal, run `. ~/.aws/mfa_session`

### Standards
- [Logging Standards](standards/logging_standard.md)
