# A collection of scripts used for image processing.
---
This directory tree contains several scripts used for image processing.
Requirements of individual scripts vary. Sometimes, the scripts simply assume that
you have the necessary packages/binaries installed and they are available to you in PATH etc.
Please read the comment section of each script before proceeding.

---
#### **denoise-raw-stack**


**Requires**
* RawTherapee
* hugins image align_image_stack libraries
* imagemagik
* A decent gpu (Turn off --gpu if you don't have one. Default: on)
* Decent amount of RAM (Atleast 2Gig free) to avoid errors.
* pp3 color profile of the raw image named `input.pp3`.
* bash
* Patience: It might take a little long to process images if you have a large stack of images.

**Usage**: Put all images in `.dng` format in input folder and run the script. Output file: output_denoise.jpg

**Process**
- DNG - Pre Process using profiles given (or default)to TIF using Rawtherapee
- TIF - align images to be stacked using hugins.
- Aligned TIF to Median Stacking using hugins.
- Script assumes that the images can be stacked and makes no effort to remove or correct the errors in the supplied images.