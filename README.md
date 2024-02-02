# Sketch Practice Assistant (Godot version)
A desktop clone of https://line-of-action.com/ via the Godot game engine and app.

# PLEASE READ BEFORE USING
Currently the app support jpg, jpeg, png, and webp files. 
The type of files that are supported by Godot are listed [here](https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/importing_images.html).
If you feel you have a need to use the other file types supported by Godot, please open an issue.

## ISSUES WITH LOADING VARIOUS IMAGE FILES
Sometimes your images might not be able to load despite being a jpg, jpeg, png, or webp file. 
This is an issue fundamentally with the Godot Engine. See [this thread](https://github.com/godotengine/godot/issues/45523).
If you run into this issue, please try converting your image or re-exporting your image via a program like GIMP, as mentioned [here](https://github.com/godotengine/godot/issues/45523#issuecomment-768977541).

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
