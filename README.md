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

![ssh.PNG](https://github.com/JohanScheepers/flutter_raspberry_pi_iot/blob/main/assets/images/ssh.PNG)


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
![sudo_apt_install_snapd.PNG](https://github.com/JohanScheepers/flutter_raspberry_pi_iot/blob/main/assets/images/sudo_apt_install_snapd.PNG)

![sudo_snap_install_core.PNG](https://github.com/JohanScheepers/flutter_raspberry_pi_iot/blob/main/assets/images/sudo_snap_install_core.PNG)



Install new flutter, then check the version.
```
sudo snap install flutter --classic
flutter channel stable
flutter --version
flutter sdk-path
flutter doctor -v
```

![flutter_--version.PNG](https://github.com/JohanScheepers/flutter_raspberry_pi_iot/blob/main/assets/images/flutter_--version.PNG)


Now you can run the doctor to ensure you have no errors in flutter
```
flutter doctor
```

If you see the Chrome error it is most likely that you have not installed Chrome on the PI.

You will also see 'Flutter IDE Support (No support IDEs installed)', we don't require this as we will not develop our applications on the Raspberry PI.

![flutter_doctor.png](https://github.com/JohanScheepers/flutter_raspberry_pi_iot/blob/main/assets/images/flutter_doctor.png)

To upgrade the version o Flutter SDK
```
flutter upgrade
```


### Clone the Application

To clone this application create directory where we are going to store our application and clone the repository.
```
mkdir Development
cd Development
sudo git clone https://github.com/JohanScheepers/flutter_raspberry_pi_iot.git

```

After the clone are complete check that it were successful

Sometimes you need to change the permissions of the files
```
sudo chmod -R 777 flutter_raspberry_pi_iot
```

Check that all the file were downloaded

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

### Wiring the PI

You can follow the detailed wiring diagram to connect the Raspberry Pi to the led and switch. Proper wiring is essential, and the diagram below provides a clear guide for this setup.

![pi_wiring.png](https://github.com/JohanScheepers/flutter_raspberry_pi_iot/blob/main/assets/images/pi/pi_wiring.png)


### Run Application

Use VNC to log into your Raspberry PI, use the "File Manager" to navigat to the folder whare the application were build.

Double click on the 'flutter_raspberry_pi_iot' file and select 'Execute'.

![flutte_and_dart_pi.mp4](https://github.com/JohanScheepers/flutter_raspberry_pi_iot/blob/main/assets/images/pi/flutte_and_dart_pi.mp4)


Or you can use the 'Main Menu Editor' to add a new item 'flutter_raspberry_pi_iot' and with comand '/home/johan/Development/flutter_raspberry_pi_iot'

![main_menu_editor.png](https://github.com/JohanScheepers/flutter_raspberry_pi_iot/blob/main/assets/images/main_menu_editor.png)



## Build Issue

The two packages require SDK Flutter 3.2.22 & Dart 3.4.3


type $env:C:\Users\Johan/.ssh/id_rsa | ssh johan@10.0.0.15 "cat >> .ssh/authorized_keys"

type $env:C:\Users\Johan\.ssh\id_rsa.pub | ssh johan@NodeRed "cat >> .ssh/authorized_keys"

type $env:USERPROFILE\.ssh\id_rsa.pub | ssh johan@NodeRed "cat >> .ssh/authorized_keys"



flutter build bundle


scp -r ./build/flutter_assets/ johan@10.0.0.12:/home/johan/Development/my_apps_flutter_assets



SSH into pi
flutter-pi --release /home/johan/Development/my_apps_flutter_assets

# Copy Files

To copy any files from you pc to the pi you can use


    scp -r * johan@10.0.0.12:~/Documents/flutter_raspberry_pi_iot