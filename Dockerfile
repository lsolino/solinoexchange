FROM ruby:2.5.1

# Adiciona as dependencias do nodejs e yarn 
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
 
# Instala as dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nodejs yarn build-essential libpq-dev imagemagick git-all nano
 
# Seta o path
ENV INSTALL_PATH /onebitexchange
 
# Cria o diretório
RUN mkdir -p $INSTALL_PATH
 
# Seta o path como o diretório principal
WORKDIR $INSTALL_PATH
 
# Seta o path para as Gems
ENV BUNDLE_PATH /gems
 
# Copia o código para dentro do container
COPY . .