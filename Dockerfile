FROM alpine:3.4

ENV BUILD_PACKAGES curl-dev ruby-dev build-base
ENV RUBY_PACKAGES add ruby ruby-bundler

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/*

RUN echo 'gem: --no-document --no-ri --no-rdoc' > /etc/gemrc

#RUN apk update && apk upgrade && apk --update add \
#    ruby ruby-irb ruby-rake ruby-io-console ruby-bigdecimal ruby-json ruby-bundler \
#    libstdc++ tzdata bash \

# Make and copy the application
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN chmod +x bin/gatekeeper
# Make sure all gems are there
RUN bundler install
# Run the application
CMD ["ruby bin/gatekeeper"]
