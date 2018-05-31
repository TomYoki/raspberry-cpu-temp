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

If the script is working correctly you will see 100 runs with 1 second timeouts.<br />
Once the script is done running you will see Highest, Average & Last temperature, as well as Temperature loss from previous run & Rating returned like this:
```
Results:

Highest temp: 42.9 'C
Average temp: 41 'C
Last temp: 40.8 'C
Temp loss: 5 'C
Rating: Good
```

Debug
----

If the script has problems rewriting prev.data file, give it permission:
```
$ sudo chmod +x prev.data
```

If you cannot run the file because of line endings (^M), this likely means you have edited the file in windows env.
Easy fix for this is to run this command line:
```
$ sed -i -e 's/\r$//' temp.sh
```

License
----

MIT

