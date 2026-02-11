#base image 

FROM ruby:3.2

#Install dependencies

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

#Setting working directory 
WORKDIR /app

COPY Gemfile* ./
RUN bundle install

#COPY PROJECT
COPY . .

#precompile assests
RUN rails assets:precompile

#Port
EXPOSE 3035

#START SERVER
CMD ["rails","server","-b","0.0.0.0"]




