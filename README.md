# selenium-url-loader

Docker image based upon python:3.7.5 with Chrome and Selenium.

## Usage

Simply pass the URL of the website that you want to test loading speed, in the command above:

```shell
docker run felipederodrigues/selenium-url-loader http://www.google.com
```

## Output

```shell
[WDM] - Current google-chrome version 83.0.4103
[WDM] - Trying to download new driver from http://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_linux64.zip
[WDM] - Unpack archive /root/.wdm/drivers/chromedriver/83.0.4103.39/linux64/chromedriver.zip
 
WEBSITE_LOADING_TIME:1.6592435836791992
```