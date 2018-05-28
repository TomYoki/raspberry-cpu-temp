# Raspberry PI Temperature

Easy-to-use tool to get cpu-idle state temperature and report statistics.
This tool will work by default on all elinux systems, this includes raspbian.

Get started
----

To get started, clone the repository.
```
$ git clone https://github.com/TomYoki/raspberry-cpu-temp
```
in order to launch the script navigate to it's folder and launch it.
```sh
~ $ cd raspberry-cpu-temp
~/raspberry-cpu-temp $ ./temp.sh
```

Reponse
----

If the script is working correctly you will see 100 runs with 1 second timeouts.
Once the script is done running you will see Highest, Average & Last temperature returned like this:
```
Results:

Highest temp: 42.9 'C
Average temp: 41 'C
Last temp: 40.8 'C

```

License
----

MIT

