FROM  ubuntu:14.10

# ----------------------- #
#  Software Installation  #
# ----------------------- #

RUN     apt-get -y install software-properties-common &&\
        add-apt-repository -y ppa:chris-lea/node.js &&\
        apt-get -y update &&\
        apt-get install -y nginx git ruby ruby-dev make gcc nodejs python2.7 python-pygments &&\
        gem install jekyll --no-rdoc --no-ri &&\
        apt-get clean &&\
        rm -rf /var/lib/apt/lists/* /tmp/*

ADD     ./clone-and-deploy.sh /src/clone-and-deploy.sh

# ---------------- #
#  Configurations  #
# ---------------- #

RUN     rm -rf /etc/nginx/*
RUN     ln -s /etc/ngin
ADD     ./nginx/* /etc/nginx/
ADD     ./nginx/sites-enabled/* /etc/nginx/sites-enabled/

EXPOSE 80

ENTRYPOINT ["/src/clone-and-deploy.sh"]
