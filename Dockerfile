# 使用 Node.js 作为基础镜像
FROM node:18-alpine

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 pnpm-lock.yaml
COPY package.json pnpm-lock.yaml ./

# 安装 pnpm
RUN npm install -g pnpm

# 安装项目依赖
RUN pnpm install

# 复制项目所有文件
COPY . .

# 构建 NestJS 项目
RUN pnpm build

# 暴露应用端口
EXPOSE 3000

# 启动应用
CMD ["pnpm", "start:prod"]