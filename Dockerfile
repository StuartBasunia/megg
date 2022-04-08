FROM anasty17/mltb:latest
# FROM anasty17/mltb-oracle:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt && \
    wget -q https://github.com/viswanathbalusu/megasdkrest/releases/download/v0.1.0/megasdkrest-${HOST_CPU_ARCH} -O /usr/local/bin/megasdkrest && \
    chmod a+x /usr/local/bin/megasdkrest && mkdir /app/ && chmod 777 /app/

COPY . .

CMD ["bash", "start.sh"]
