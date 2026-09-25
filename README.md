# Server Init

一键 Linux 服务器初始化脚本。

本项目将多个常用的服务器初始化操作整合到一个脚本中，适用于新 VPS / 云服务器的快速初始化。

---

## 🇨🇳 中文说明

### 功能

本脚本会按照以下顺序自动执行：

1. 更新 APT 软件源
2. 安装 `curl`
3. 安装 Docker
4. 执行 BBR 优化
5. 执行服务器审计

整个过程无需手动逐条执行命令。

### 支持系统

主要适用于 Debian / Ubuntu 系统。

推荐：

* Debian 11
* Debian 12
* Ubuntu 22.04
* Ubuntu 24.04

需要使用 `root` 权限运行。

---

## 🚀 一键使用

使用 `root` 用户登录服务器后，执行：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/krililrify/server-init/main/install.sh)
```

脚本会自动按照以下顺序执行：

```text
更新 APT
   ↓
安装 curl
   ↓
安装 Docker
   ↓
BBR 优化
   ↓
服务器审计
   ↓
完成
```

执行过程中会显示每个步骤的状态。

如果某个关键步骤执行失败，脚本会停止执行，避免在前一步失败的情况下继续进行后续操作。

---

## 📦 包含的功能

### Docker

自动安装 Docker，并检查 Docker 是否安装成功以及服务是否正常运行。

### BBR

自动执行 BBR / 网络优化脚本。

### 服务器审计

自动执行服务器主机相关审计。

---

## ⚠️ 安全说明

本项目会自动下载并执行第三方远程脚本。

在生产服务器上使用之前，请确认你信任相关脚本的来源。

由于安装过程需要 `root` 权限，请确认服务器环境后再执行。

本项目主要负责将多个初始化操作整合为一个统一入口，第三方脚本的具体行为及后续更新由其原作者负责。

---

## 📁 项目结构

```text
server-init/
├── install.sh
└── README.md
```

其中：

* `install.sh`：一键服务器初始化脚本
* `README.md`：项目说明文档

---

# 🇬🇧 English

## Server Init

One-click Linux server initialization script.

This project combines several common Linux server initialization tasks into a single script.

### Features

The script performs the following tasks in order:

1. Update APT package lists
2. Install `curl`
3. Install Docker
4. Run BBR optimization
5. Run host audit

### Supported Systems

Primarily designed for Debian and Ubuntu systems.

Recommended:

* Debian 11
* Debian 12
* Ubuntu 22.04
* Ubuntu 24.04

Root privileges are required.

---

## 🚀 Quick Start

Log in to your server as `root` and run:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/krililrify/server-init/main/install.sh)
```

The script will automatically execute all initialization tasks in sequence.

```text
Update APT
   ↓
Install curl
   ↓
Install Docker
   ↓
BBR optimization
   ↓
Host audit
   ↓
Complete
```

The script displays the status of each step during execution.

If a critical step fails, the script will stop instead of continuing with subsequent tasks.

---

## ⚠️ Security Notice

This project downloads and executes third-party scripts from remote URLs.

Please make sure you trust the referenced script sources before using this project on production servers.

Root privileges are required.

This project mainly provides a unified entry point for server initialization. The behavior and future updates of third-party scripts are maintained by their respective authors.

---

## 📁 Project Structure

```text
server-init/
├── install.sh
└── README.md
```

* `install.sh` — One-click server initialization script
* `README.md` — Project documentation

---

## License

For personal use.
