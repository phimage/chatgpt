# chatgpt

[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://mit-license.org)
[![Platform](http://img.shields.io/badge/platform-macOS_Linux-lightgrey.svg?style=flat)](https://developer.apple.com/resources/)
[![Language](http://img.shields.io/badge/language-swift-orange.svg?style=flat)](https://developer.apple.com/swift)
[![build](https://github.com/phimage/chatgpt/actions/workflows/build.yml/badge.svg)](https://github.com/phimage/chatgpt/actions/workflows/build.yml)
[![Sponsor](https://img.shields.io/badge/Sponsor-%F0%9F%A7%A1-white.svg?style=flat)](https://github.com/sponsors/phimage)

My cli tool description

## Usage

```bash
    chatgpt --token "token from https://beta.openai.com/account/api-keys" "your prompt"
```

### Interactive mode

```bash
    chatgpt --token "token from https://beta.openai.com/account/api-keys" --interactive
```

"stop", "quit" or "exit" to stop

## Install

build it (and move it to `PATH`)

## Build yourself

```bash
swift build -c release
```

or if we want without swift runtime dependencies (ie static executable)

```bash
swift build -c release -Xswiftc -static-executable
```

## CI

This projet is build using action [action-swift-cli-build](https://github.com/phimage/action-swift-cli-build)
