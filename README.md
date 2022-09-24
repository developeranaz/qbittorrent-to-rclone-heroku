# added anti-ban 
* rclone uploads replaced with a new download page.
* for more runtime use [website-pinger](https://github.com/developeranaz/Website-Pinger) or any external pingers
* VueTorrent web ui added

# qBittorrent 
Heroku has set torrent reuploaders or URL reuploaders as a policy violating source code.Please use it at your own risk, your heroku account has a higher chance of being banned.

This web application downloads your torrent-files or magnet links or torrent http links and uploads directly to your any rclone drive instantly.
Here qBittorrent-nox (Linux) is used as web UI And Rclone is used as Uploader with the help of Docker.

Special thanks to rclone and qbittorrent-nox

![Demo](https://raw.githubusercontent.com/developeranaz/qbittorrent-to-rclone-heroku-beta/main/demo/Screenshot%202022-01-09%20180328.png)







## How To Deploy ?
### Step 1
* Star my repository
* Create a [Heroku](https://dashboard.heroku.com/login) Free account
* Log in to Heroku in any browser
* Click on the Rapid deployment button [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://developeranaz.github.io/qbittorrent-to-rclone-heroku/random.html) and deploy app
### Step 2 (setting Config Vars)
* Go to deployed application in heroku
* Switch to application settings.
* Scroll down to see `config vars` > click `Reveal Config Vars`.



#### ii) WEBUSER
* Type Your new Username in `WEBUSER` section

#### iii) WEBPASSWORD
* Type Your New Password in `WEBPASSWORD` section

##### iv) SELFPING (Optional hidden config var)
 This config var is hidden and can be activated by 
* Go to deployed application in heroku
* Switch to application settings.
* Scroll down to see `config vars` > click `Reveal Config Vars`.
* use key as `selfping` and corresponding value as `your-deployed-app-name` 
* example [image here](https://raw.githubusercontent.com/developeranaz/qbittorrent-to-rclone-heroku/main/demo/-4962988908900100631_121.jpg)


 [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://developeranaz.github.io/qbittorrent-to-rclone-heroku/random.html) 



whats new


## Added  VueTorrent (Optional hidden config var)
 This config var is hidden and can be activated by 
* Go to deployed application in heroku
* Switch to application settings.
* Scroll down to see `config vars` > click `Reveal Config Vars`.
* Use `alternative_webui ` as key &  corresponding `true`  as value to activate vuetorrent

```
alternative_webui
```


![image](https://user-images.githubusercontent.com/71500526/191953225-9b590349-2b32-42c5-a5fd-ca9cd26edb45.png)

## Common Errors
* If  `This page isn’t workingIf the problem continues, contact the site owner. HTTP ERROR 401` is shown in browser change your browser url from `https://myapp.herokuapp.com` to `http://myapp.herokuapp.com/` . ie., change https to http

## SCREENSHOTS


![demoo](https://raw.githubusercontent.com/developeranaz/qbittorrent-to-rclone-heroku-beta/main/demo/Screenshot%202022-01-09%20181831.png)
![demoo](https://raw.githubusercontent.com/developeranaz/qbittorrent-to-rclone-heroku-beta/main/demo/image.png)



