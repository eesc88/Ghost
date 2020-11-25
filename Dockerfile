# 配置运行基础环境
FROM node:14.15.0
# 添加Ghost依赖环境
RUN yarn global add knex-migrator grunt-cli ember-cli
# 在容器中创建一个目录
RUN mkdir -p /usr/src/nodejs/
# 定位到容器的工作目录
WORKDIR /usr/src/nodejs/
# RUN/COPY 是分层的，package.json 提前，只要没修改，就不会重新安装包
COPY package.json /usr/src/app/package.json
RUN cd /usr/src/app/
# 把当前目录下的所有文件拷贝到 Image 的 /usr/src/nodejs/ 目录下
COPY . /usr/src/nodejs/
RUN yarn setup
 
EXPOSE 2368
CMD export NODE_ENV=production && npm start