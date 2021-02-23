FROM ruby:3.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client && apt-get install -y yarn

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn postgresql-client

RUN mkdir /blogapp2019
WORKDIR /blogapp2019
COPY Gemfile /blogapp2019/Gemfile
COPY Gemfile.lock /blogapp2019/Gemfile.lock
# bundlerのエラーへの対処するためにBundler 2系をインストール
RUN gem install bundler
RUN bundle install
COPY . /blogapp2019

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]