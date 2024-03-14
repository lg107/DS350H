# Data Science Major Capstone
By: Lucia Gurrieri
Advisor: Eni Mustafaraj
Help from: Ashley Kang, Adelle Wang, Daisy Appiah-Kubi, Edith Po, Lillie Godinez, and Dora Li

The purpose of this project is to understand how video performance statistics and characteristics can predict a high rate of video popularity, and what hashtags tend to get a higher rate of video views. I examine video metadata collected from a sample of videos from user browsing histories.

This project uses the PykTok and PykTok-collect modules, modified by the CS 315 class, to collect video metadata on TikTok and return a CSV file. 
Data analysis and modeling takes place in RStudio, in the file Capstone_Code.

## Collect user data from TikTok
Open TikTok, go to Settings and Privacy --> Account --> Download your data, and request your data as a JSON file. Your request should be filled within a few days. 

We are interested in the Browsing History, so locate data['Activity']['Video Browsing History']['VideoList']. This contains each video viewed by the user, represented by a time stamp and URL. Turn this into a JSON spreadsheet with 2 columns: time stamp and URL.

## How to Run the Code
### 1. Clone the GitHub Repository
You should be able to clone the repository by running
```
git clone https://github.com/lg107/DS350H
```
or by cloning manually on GitHub Desktop.

### 2. Open VS Code
2. Activate conda's base environment (should show ```(base)``` before your directory in your terminal)

### 3. Create a virtual environment
**a.** Open a terminal in conda's base environment. 

**b.** Run the command: 
    
    python -m venv .venv

This will create a directory called `.venv`. This directory contains its own Python version and package manager, which means that when activated, the Python version you use is located in .venv rather than your global Python version. Any packages installed while the venv is activated will only be accessible in the virtual environment.

**c.** Activate the virtual environment. This command varies between platforms. On Windows, it is
        
    .venv/Scripts/activate

and on Mac/Linux the command should be

    source .venv/bin/activate

### 5. Install Required Packages
Run this code to install the required packages and libraries:
    python install -r requirements.txt
   
### 6. Run the Code
User data should be in the form of a JSON file. The results file should be a CSV file in the appropriate directory. In the virtual environment, run the command:
    python -m pyktok-collect.py (user data file) (results file)
This will create a CSV file. The code will open the specified browser (in this case, Firefox). If the TikTok video URL is valid (i.e. the video exists), the code requests to get the video's metadata as a JSON object. Then, the code returns the JSON object in string form from HTML.
After collecting all data, returns a CSV file with the TikTok metadata. This includes: 
        1.  "Video_id": ID of the video
        2.  "Video_timestamp”: Time video posted
        3.  "Video_duration": Length of video (in seconds)
        4.  "Video_locationcreated": Country of origin
        5.  "Video_diggcount": No. likes on the video
        6.  "Video_sharecount": No. shares on the video
        7.  "Video_commentcount": No. comments on the video
        8.  "Video_playcount": No. views on the video
        9.  "Video_description": Description on the video including hashtags
        10. "Video_is_ad": Boolean if video is advertisement
        11. "Author_username": Username of video author
        12. "Author_verified": If the author is verified

## Data Analysis
### See Capstone_Code.R for data cleaning and analysis
