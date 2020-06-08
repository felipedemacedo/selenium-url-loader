FROM python:3.7.5

MAINTAINER felipedemacedo.cin@gmail.com

# set display port to avoid crash
ENV DISPLAY=:99
# ENV CHROME_BIN=/usr/bin/google-chrome
# ENV CHROME_VERSION=78.0.3904.17-1

# install google chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable xvfb

# install chromedriver
RUN apt-get install -yqq unzip
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

# start Xvfb
# RUN Xvfb :99 -screen 0 1280x1024x24 &

COPY . ./

RUN pip install -r requirements.txt

ENTRYPOINT [ "python", "-W", "ignore", "./src/main.py", "--url" ]
