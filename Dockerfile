FROM ruby:3.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /BlogApp2019
WORKDIR /BlogApp2019
COPY Gemfile /BlogApp2019/Gemfile
COPY Gemfile.lock /BlogApp2019/Gemfile.lock
# bundlerのエラーへの対処するためにBundler 2系をインストール
RUN gem install bundler
RUN bundle install
COPY . /BlogApp2019

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]