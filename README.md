# An ACAP application pushing metrics

NOTES:
No underscores can exist in the app name or there's bugs on the UI for
setting params

This README file explains how to build an ACAP application that pushes
diagnostics to `pushgateway`.  It is achieved by using the containerized
API and toolchain images.

## Getting started

### How to run the code

Below is the step by step instructions on how to execute the program.
So basically starting with the generation of the .eap file to running
it on a device:

#### Build the application

Standing in your working directory run the following commands:

> [!NOTE]
>
> Depending on the network your local build machine is connected to,
> you may need to add proxy settings for Docker. See
> [Proxy in build time][build-time-proxy].

```sh
docker build --tag <APP_IMAGE> .
```

<APP_IMAGE> is the name to tag the image with, e.g., `metrics:latest`

Default architecture is **armv7hf**. To build for **aarch64** it's possible to
update the *ARCH* variable in the Dockerfile or to set it in the docker build
command via build argument:

```sh
docker build --build-arg ARCH=aarch64 --tag metrics:latest .
```

Copy the result from the container image to a local directory build:

```sh
docker cp $(docker create metrics:latest):/opt/app ./build
```

#### Install and start the application

Browse to the application page of the Axis device:

```sh
http://<AXIS_DEVICE_IP>/index.html#apps
```

- Click on the tab `Apps` in the device GUI
- Enable `Allow unsigned apps` toggle
- Click `(+ Add app)` button to upload the application file
- Browse to the newly built ACAP application, depending on architecture:
  - `metrics_1_0_0_aarch64.eap`
  - `metrics_1_0_0_armv7hf.eap`
- Click `Install`
- Run the application by enabling the `Start` switch

[build-time-proxy]: https://axiscommunications.github.io/acap-documentation/docs/develop/proxy#proxy-in-build-time
