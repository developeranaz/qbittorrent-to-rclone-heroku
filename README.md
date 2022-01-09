# qBittorrent to Rclone 

This web application downloads your torrent-files or magnet links or torrent http links and uploads directly to your any rclone drive instantly.
Here qBittorrent-nox (Linux) is used as web UI And Rclone is used as Uploader with the help of Docker.

Special thanks to rclone and qbittorrent-nox

![Demo](https://raw.githubusercontent.com/developeranaz/qbittorrent-to-rclone-heroku-beta/main/demo/Screenshot%202022-01-09%20180328.png)


## How To Deploy ?
### Step 1
* Star my repository
* Create a [Heroku](https://dashboard.heroku.com/login) Free account
* Log in to Heroku in any browser
* Click on the Rapid deployment button [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://dashboard.heroku.com/new?template=https://github.com/dev-extended/developeranaz-780636CE89D20522271DF0805C35D433EF827019F263D4A875FFC762D8F4F039) and deploy app
### Step 2 (setting Config Vars)
* Go to deployed application in heroku
* Switch to application settings.
* Scroll down to see `config vars` > click `Reveal Config Vars`.

#### i) RCLONE_CONFIG_IN_RAW_URL

* Generate rclone.conf file from any terminal or cmd or termux or by using RCX android.
* Make sure you have a valid config and the `remote name` shouldn't have spaces in it. eg- `[devanaz]`
* You can't use Multiple cloud drive accounts in single rclone.conf file, if you done that your first config is only taken for upload.
* We need any text/code hosting website, Use [gist-github](https://gist.github.com) github account needed.
* Open rclone.config file using any text editors and copy all text inside rclone.conf and paste it in gist
* Choose any file name and save it by clicking `Create secret gist`.
* Then Click RAW button and copy the url (RAW is important)
* Paste your config Url in the heroku 'RCLONE_CONFIG_IN_RAW_URL' Section 
* note : Don't share this url to anyone

#### ii) WEBUSER
* Type Your new Username in `WEBUSER` section

#### iii) WEBPASSWORD
* Type Your New Password in `WEBPASSWORD` section


 [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://dashboard.heroku.com/new?template=https://github.com/dev-extended/developeranaz-780636CE89D20522271DF0805C35D433EF827019F263D4A875FFC762D8F4F039) 

## SCREENSHOTS


![demoo](https://raw.githubusercontent.com/developeranaz/qbittorrent-to-rclone-heroku-beta/main/demo/Screenshot%202022-01-09%20181831.png)
![demoo](https://raw.githubusercontent.com/developeranaz/qbittorrent-to-rclone-heroku-beta/main/demo/image.png)



