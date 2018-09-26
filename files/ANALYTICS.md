Workstation-setup collects anonymous usage statistics to help us improve this tool.  An 'event' is logged with a Pivotal-owned Google Analytics account when `./setup` is started and when it is finished successfully.

This event contains the following data:
- full list of command line options to `./setup`
- the hostname of the machine you are running on (for deduplication)
- a unique random number (to match start and finish events)

Google analytics will also provide us with counts of approximate locations (nearest city) where workstation-setup was run.  We do NOT log your IP address or any other identifiable information, beyond the computer hostname.

Only Pivotal employees working on workstation-setup will be able to see the analytics results.

You can disable all analytics by using an environment variable:
```
SKIP_ANALYTICS=1 ./setup.sh java ruby node golang c docker
```
This will also disable brew's [data collection](https://github.com/Homebrew/brew/blob/master/docs/Analytics.md).
