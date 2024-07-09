# flutter_raspberry_pi_iot

This project is to get Flutter Linux up and running on a Raspberry PI.

## Getting Started

### OS for Raspberry PI

The requirements to run Flutter on Linux is a 64-bit operating system. This is available for most PI.

Just a word of caution, on some of the smaller PI the build process takes a very long time, build on a PI 4 and then copy the build files over. And the first versions of PI Zero don't support 64-bit.

If you visit [Raspberry PI](https://www.raspberrypi.com/software/) web site you can download the latest version of their imager tool. This will enable you to flash the latest OS to your SD card.

Now you can insert this into your PI and boot it up.

Next I get the VNC server up and running and also SSH. I sometimes use VNC to access the PI and other times SSH, this all depends on your preferences on how to remote access your PI. Some of you might not want to do remote access, then you will not configure these methods.

These two options need to be enabled - Application Menu => Preferences => Raspberry PI Configuration => Interfaces.

Here select SSH and VNC and select OK.

Now you will be able to log in via SSH

### Software packages requirements

To install al the software applications I will SSH in to the PI using its IP address (please verify you IP and it will most probably not be the same) from the command prompt of my laptop

flutter_raspberry_pi_iot\assets\images\ssh.png

Next we need to check if git were installed on the Raspberry PI. From the terminal we run
```
git
```

Next check if you PI are up to date

```
sudo apt update
```

If you need to upgrade run
```
sudo apt upgrade
```

Install snapd and snap core.
```
sudo apt install snapd
sudo snap install core
```
flutter_raspberry_pi_iot\assets\images\sudo apt install snapd.png
flutter_raspberry_pi_iot\assets\images\sudo snap install core.png

Install new flutter, then check the version.
```
    sudo snap install flutter --classic
//flutter channel stable
//flutter --version
flutter sdk-path
flutter doctor -v
```
raspberry_pi\assets\images\flutter_--version.png

Now you can run the doctor to ensure you have no errors in flutter
```
flutter doctor
```

If you see the Chrome error it is most likely that you have not installed Chrome on the PI.

You will also see 'Flutter IDE Support (No support IDEs installed)', we don't require this as we will not develop our applications on the Raspberry PI.

flutter_raspberry_pi_iot\assets\images\flutter_doctor.png

### Clone the Application

To clone this application create directory where we are going to store our application and clone the repository.
```
mkdir Development
cd Development
sudo git clone https://github.com/JohanScheepers/flutter_raspberry_pi_iot.git
```

After the clone are complete check that it were successful
```
cd flutter_raspberry_pi_iot
ls -l
```

### Build the Application

To build your application, please ensure you are in the correct directory.

```
flutter build linux
```
The 'flutter build linux' can only be run from a linux host.

Your application will now be in
```
/home/johan/Development/flutter_raspberry_pi_iot/build/linux/arm64/release/bundle
```

flutter_raspberry_pi_iot\assets\images\flutter_raspberr_pi_bundle.png

### Run Application

Use VNC to log into your Raspberry PI, use the "File Manager" to navigat to the folder whare the application were build.

Double click on the 'flutter_raspberry_pi_iot' file and select 'Execute'.

flutter_raspberry_pi_iot\assets\images\flutter_iot.png

Or you can use the 'Main Menu Editor' to add a new item 'flutter_raspberry_pi_iot' and with comand '/home/johan/Development/flutter_raspberry_pi_iot'

flutter_raspberry_pi_iot\assets\images\main_menu_editor.png


flutter pub add syncfusion_flutter_charts
flutter pub add syncfusion_flutter_gauges

