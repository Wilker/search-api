FROM ruby:2.6.3

# atualiza repositórios e instala nginx
RUN apt-get update -y && apt-get install cron nodejs -y

WORKDIR /usr/src/app/api/search-api

# Copia o Gemfile antes de aplicação para permitir o cache do bundle install
COPY Gemfile Gemfile.lock ./

# Instala as gems
RUN bundle install

# Copia a aplicação em si
COPY . .

# Limpa cache e tmp, diminuindo tamanho da imagem e ajudando no cache
RUN rm -rf /tmp/* /var/tmp/* && apt-get clean

# Executa o Puma
CMD bundle exec puma -C config/puma.rb
