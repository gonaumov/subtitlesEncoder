#  Subtitles converter

This is a little converter of subtitles encodings which I have assembled because often 
I need to convert subtitles encoding under Windows and for funn purposes also. Sadly 
the embeded media plear doesn't support Windows-1251 encoding. In fact this is my first 
experiment with Powershell. 

## What it does exactly?

It iterates current directory and finds all subtitles files (files with *.*.srt)
reqursive. If they have UTF-8 encoding it just creates copy of them 
using UTF-8 with bom, otherwise it the content of  the file encoding 
and converts it from Windows-1251 to UTF-8 with BOM and after that creates copy. 
The copyes are created under `converted_files` directory which keeps the 
same structure as the folder where the script is executed. Just one directory
below - under `converted_files`.

## How to use it? 
Just copy it inside directory which contains the subtitles and press 
right button -> `Run with Powershell`

![ScreenShot](/images/demo.png)


