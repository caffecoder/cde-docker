FROM xcdr/cde-baseimage
MAINTAINER Adam Kubica <xcdr@kaizen-step.com>

ARG RUBY_VERSION=2.4.0
ARG LIBSSL_PACKAGE=libssl-dev

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y git-core
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libffi-dev
RUN apt-get install -y libgmp-dev
RUN apt-get install -y libreadline-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y $LIBSSL_PACKAGE

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

