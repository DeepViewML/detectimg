# Image Based General Detection
This code example demonstrates how to run general detection using VAAL. The C code in detectimg.c contains the sample application that runs general detection and demonstrates how it can be modified to fit your needs. This repo contains information on how to run this application on Maivin using Torizon, directly using Docker on Maivin, on an EVK as well as on one's desktop.

## VAAL Workflow
When creating a VAAL Application, there are 3 stages involved, Initialization, Inference Loop, and Deallocation. The Inference Loop stage is composed of three main components, preprocessing, inference, and post-processing. We will examine each and provide a general overview and how to make modifications within those to tailor the application to one's parameters.

### Initialization
This stage of the VAAL Workflow handles the creation of a context, the loading of a model as well as setting any additional parameters that may be necessary.

To create a context with a pre-determined model the following can be written as seen in detectimg.c lines 138-140
```
VAALContext* ctx = vaal_context_create(engine);
err = vaal_load_model_file(ctx, model);
```

The first line initializes the Context, a base structure used by VAAL for all matters related to the workflow. Please see additional documentation for further information. The engine parameter provided determines which Processing Unit to perform inference upon, with current support for CPU, GPU, and NPU.

The second line handles the loading and memory allocation for the RTM Model provided. See [here]() for further information on generating your own RTM Models.

Once these two lines have been run, your Context has been prepared and is ready for inference.

In some cases, particularly in this case of object detection, additional parameters can be held by the Context to provide information for pre and post-processing.

```
vaal_parameter_seti(ctx, "max_detection", &max_detection, 1);
vaal_parameter_setf(ctx, "score_threshold", &score_thr, 1);
vaal_parameter_setf(ctx, "iou_threshold", &iou_thr, 1);
vaal_parameter_seti(ctx, "normalization", &norm, 1);
```

The code above sets values for normalization of images in pre-processing as well as parameters that will be used for NMS post-processing of the detection boxes. These parameters are stored as a dictionary within the context, so any name can be stored, but only some are recognized. To see the full list of recognized parameters, follow this [link]().

Additionally, for initialization, depending on the type of model that is being used, a structure will need to be initialized to store the resultant post-processed information. These can be initialized as follows

```
VAALBox* boxes = calloc(max_detection, sizeof(VAALBox));
VAALKeypoint* keypoints = calloc(max_detection, sizeof(VAALKeypoint));
VAALEuler* orientations = calloc(max_detection, sizeof(VAALEuler));
```

These are the current three structures that are supported by VAAL and have their associated post-processing functions built-in to the VAAL Library. The VAALBox structure is used during object detection, it stores the box coordinates as well as the associated score and label. The VAALKeypoint structure is used during keypoint detection, finding specific keypoints on an object, for example, joints on a human body. A keypoint will store the x,y location, the score and label of a keypoint. The VAALEuler structure is used for pose estimation, with our most prominent use case, being head orientation. An Euler structure will contain the yaw, pitch, and roll information.



## Maivin Using Torizon

### Setup
1. Please see https://support.deepviewml.com/hc/en-us/articles/10977327933965-Visual-Studio-Torizon-Plugin for installing the extension and attaching your Maivin.
2. Once this has been setup, within VSCode navigate to Run -> Start Debugging and the project will be run on the Maivin.

### Modifications
To change what model or images are used with the general detection app, on the left toolbar in VSCode, select the Torizon Extension. Go to the Configurations section and from here you can change what model or images are used. These new models and images must be provided in the appconfig_0 folder to be accessible through the Torizon extension.

## Maivin Using Docker on Target

## EVK ArmV8

## Desktop x86-64