
FROM docker.io/library/node:14


ENV PUPPETEER_SKIP_DOWNLOAD=true

# Install Chromium.
RUN \
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y google-chrome-stable && \
  rm -rf /var/lib/apt/lists/* && \
  npm install -g decktape@3.1.0 && \
  mkdir -p /slides

WORKDIR /slides

ENTRYPOINT ["decktape", "--chrome-arg=--no-sandbox", "--chrome-path=/usr/bin/google-chrome"]

CMD ["-h"]
