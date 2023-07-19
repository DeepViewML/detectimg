# Image Based General Detection
This code example demonstrates how to run general detection using VAAL. The C code in detect_app.c contains the sample application that runs general detection and demonstrates how it can be modified to fit your needs. This repo contains information on how to run this application on Maivin using Torizon, directly using Docker on Maivin, on an EVK as well as on one's desktop.

## Maivin Using Torizon

### Setup
1. Please see https://support.deepviewml.com/hc/en-us/articles/10977327933965-Visual-Studio-Torizon-Plugin for installing the extension and attaching your Maivin.
2. Once this has been setup, within VSCode navigate to Run -> Start Debugging and the project will be run on the Maivin.

### Modifications
To change what model or images are used with the general detection app, on the left toolbar in VSCode, select the Torizon Extension. Go to the Configurations section and from here you can change what model or images are used. These new models and images must be provided in the appconfig_0 folder to be accessible through the Torizon extension.

## Maivin Using Docker on Target

## EVK ArmV8

## Desktop x86-64