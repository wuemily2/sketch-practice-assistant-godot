# Sketch Practice Assistant (Godot version)
A desktop clone of https://line-of-action.com/ via the Godot game engine and app.

## Example Usage
The Illustration software pictured with the app is Clip Studio Paint. Reference Photo by <a href="https://unsplash.com/@garrethpb?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Garreth Paul</a> on <a href="https://unsplash.com/photos/yellow-lemon-fruit-on-clear-glass-bowl-euFGodD4O-M?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash">Unsplash</a>
  
![SampleUse0](https://github.com/wuemily2/sketch-practice-assistant-godot/assets/56324574/1925cbed-1088-4c65-b51c-e5c87ce4f820)
![SampleUse](https://github.com/wuemily2/sketch-practice-assistant-godot/assets/56324574/c37b4da0-56be-4f1a-94c2-785f6c5aa044)

## Godot version used
4.2.1

# PLEASE READ BEFORE USING
Currently the app support jpg, jpeg, png, and webp files. 
The type of files that are supported by Godot are listed [here](https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/importing_images.html).
If you feel you have a need to use the other file types supported by Godot, please open an issue.

## ISSUES WITH LOADING VARIOUS IMAGE FILES
Sometimes your images might not be able to load despite being a jpg, jpeg, png, or webp file. 
This is an issue fundamentally with the Godot Engine. See [this thread](https://github.com/godotengine/godot/issues/45523).
If you run into this issue, please try converting your image or re-exporting your image via a program like GIMP, as mentioned [here](https://github.com/godotengine/godot/issues/45523#issuecomment-768977541).

### Resolving incompatible issues with bash scripting and image conversion
I wrote a script to batch convert incompatible files within a directory using [ImageMagick](https://imagemagick.org/index.php). This script does not go into nested directories.
In the script I wrote for jpg images below, I can run this script in a bash terminal and convert all the jpg images in a targeted directory (and, by choice, I place it in a directory nested inside the directory).
You can download Git Bash for example to run this.
The "$1" in the script below refer to the first argument given to the bash script. You need an absolute path or a relative path. An example is "C:\Users\woodl\Pictures\Photo Reference and Bash Stash\Alligator".
```bash
#!/bin/bash
mkdir "$1"/converted_images
# The following was added based on https://stackoverflow.com/questions/12259331/for-loop-for-multiple-extension-and-do-something-with-each-file
shopt -s nocaseglob # ignore case when searching
for filename in "$1"/*.jpg; do
    name=$(basename "$filename")
    magick convert "$filename" "$1"/"converted_images"/"converted_$name"
done
shopt -u nocaseglob # Unsets nocaseglob
```
To execute the script, run something like the following:  (Keep the quotes! They are important for letting the script know it's one argument.)

```bash
./script_name.sh "{target_directory}"
```
For C:\Users\woodl\Pictures\Photo Reference and Bash Stash\Alligator, you would run
```bash
./script_name.sh "C:\Users\woodl\Pictures\Photo Reference and Bash Stash\Alligator"
```
After running, you should see a folder called "converted_images" in the target directory which contains the converted images.

Note that this script does not fix rotation issues (that is to say, if the image was compatible, shows as rotated upright in a Windows image viewer app, but displays as sideways in my app).

## LOADING ARBITRARY IMAGES IS A SECURITY RISK
It is a well known problem that opening an maliciously crafted image can potentially hack your computer.
Take extra caution that you do not select a potentially maliciously crafted image to load into the app, that can possibly take advantaged of some undisclosed vulnerability in the way Godot handles image parsing.
I do not take responsibility for hacking caused by images you load of your own accord.

# Progress
Completed

## Nice to haves that can be completed in the future
- Have a MacOS export of the app
- add an icon to the linux executable
- Using icons instead of words for various buttons. This will also help in ui resizing as text takes up a lot of space and Godot prioritizes a minimum space for text.
- allow image zoom

## Planned additions
- Adding a way to load in files and directories to loop through via a settings file (text or json), because inputting a set of paths is troublesome to do via godot ui
## Possible notable issues
- if there are multiple screens and the Image Cycler is dragged to a separate screen, it will resize properly. However, the file choosing dialog popup opens up on on the initial screen. A fix to this should be to have the dialog open up on the same screen as the main app window
