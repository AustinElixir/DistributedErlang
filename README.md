# DistributedErlang
This project is a collection of simple functions that are used to demonstrate Erlang's native distribution capabilities.

The tutorial will take you through all the basics needed to setup a fully functioning Erlang cluster of nodes.

After completing this exercise, you'll have the capability of setting up custom distribution algorithms for a simple factorial service in your Erlang cluster.

Setup Guide
===========
#### Download Project Structure

- `git clone https://github.com/austinerlang/DistributedErlang`

#### Setup Virtual Dev Environment

##### VAGRANT

Make sure you have vagrant [installed](http://docs.vagrantup.com/v2/installation/)

- `vagrant up` & select your bridge interface.

```bash
==> default: Available bridged network interfaces:
1) eth0
2) wlan0
3) ...
4) ...
==> default: When choosing an interface, it is usually the one that is
==> default: being used to connect to the internet.
    default: Which interface should the network bridge to?
```

For our lab you'll probably be using your wireless interface. Enter the number listed next to the appropriate interface.

- `vagrant ssh` will connect you into your virtual environment.

#### Tutorial

For now, this repo only supports the workshop we host in person. If you are in the workshop please follow along with the instructor.

For those at home, we will have a branch coming soon just for setting up clusters with docker and going through the workshop on your own.