FROM xcdr/cde-baseimage
MAINTAINER Adam Kubica <xcdr@kaizen-step.com>

ARG RUBY_VERSION=2.3.4

RUN apt-get update
RUN apt-get -y install build-essential
RUN apt-get -y install git-core
RUN apt-get -y install libcurl4-openssl-dev
RUN apt-get -y install libffi-dev
RUN apt-get -y install libgmp-dev
RUN apt-get -y install libreadline-dev
RUN apt-get -y install libssl-dev
RUN apt-get -y install zlib1g-dev
RUN apt-get -y install curl

RUN git clone git://github.com/sstephenson/rbenv.git /opt/rbenv
RUN git clone git://github.com/sstephenson/ruby-build.git /opt/rbenv/plugins/ruby-build
RUN cd /opt/rbenv/plugins/ruby-build && ./install.sh

RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
RUN echo 'export RBENV_ROOT=/opt/rbenv' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

RUN echo "gem: --no-rdoc --no-ri" >> ~/.gemrc

RUN chmod +x /etc/profile.d/rbenv.sh

ENV RBENV_ROOT /opt/rbenv
ENV PATH /opt/rbenv/bin:/opt/rbenv/shims:$PATH

RUN rbenv install $RUBY_VERSION
RUN rbenv global $RUBY_VERSION

RUN gem install bundler

RUN rbenv rehash

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]

