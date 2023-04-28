# iOS项目工程化

demo运行，clone源码，先安装rbenv，之后，运行以下命令安装所有必需的组件并设置开发环境：
```
./scripts/setup.sh
```

通过 Xcode、rbenv、RubyGems 和 Bundler 搭建⼀个统⼀的 iOS 开发和构建环境。

因为在 iOS 开发⽅⾯, ⽬前流⾏的第三⽅⼯具 CocoaPods 和 fastlane 都是使⽤ Ruby 来开发的. 
特别是 Ruby 有⾮常成熟的依赖库管理⼯具 RubyGems 和 Bundler, 其中 Bundler 可以帮我们有效地管理 CocoaPods 和 fastlane 的版本。

为了⾃动化安装和管理这些⼯具, 整个项⽬团队所使⽤的 Ruby 版本也必须保持⼀致. 
⽬前流⾏的 Ruby 环境管理⼯具有 RVM 和 rbenv.推荐使⽤的是 rbenv, 因为它使⽤ shims ⽂件夹来分离各 个 Ruby 版本, 相对于 RVM 更加轻装⽽⽅便使⽤. 千万注意, 团队内部不要同时使⽤不同的 Ruby 环境管理⼯具, 否则项⽬编译会出错. rbenv 是 Ruby 环境管理⼯具, 能够安装、管理、隔离以及在多个 Ruby 版本之间切换. 

## rbenv
1. 安装使⽤ rbenv, 我们可 以通过 Homebrew 来安装它, 下⾯是安装 Homebrew 和 rbenv 的脚本
```
brew install rbenv ruby-build
```
2. shell 中设置 rbenv
```
#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
```
3. rbenv 使用指南和常用命令
https://ruby-china.org/wiki/rbenv-guide
```
安装 ruby
rbenv install --list  # 列出所有 ruby 版本
rbenv install  

列出版本
rbenv versions               # 列出安装的版本
rbenv version                # 列出正在使用的版本

设置版本
rbenv global 1.9.3-p392      # 默认使用 1.9.3-p392
rbenv shell 1.9.3-p392       # 当前的 shell 使用 1.9.3-p392, 会设置一个 `RBENV_VERSION` 环境变量
rbenv local jruby-1.7.3      # 当前目录使用 jruby-1.7.3, 会生成一个 `.rbenv-version` 文件
```

## Cocoapods
官网 https://cocoapods.org/

安装：
```
sudo gem install cocoapods
```

## Git

 https://www.toptal.com/developers/gitignore ⾥⾯输⼊关键字, 例如 swift,xcode,cocoapods,fastlane等, 然后该⽹站会帮我们⽣成⼀个默认的 .gitignore ⽂件.


## RubyGems 和 Bundler
RubyGems 和 Bundler 主要是⽤来安装和管理 CocoaPods 和 fastlane 等第三⽅⼯具.

1. 安装 Bundler
```
gem install bundler
```
2. 使用Bundler，在项目目录中执⾏**bundle init**⽣成⼀个 Gemfile ⽂件, 像 CocoaPods 和 fastlane 等依赖包
```
bundle init
```
3. Gemfile添加三方工具CocoaPods 和 fastlane 
```
source "https://rubygems.org"

gem "cocoapods", "1.11.3"
gem "fastlane", "2.211.0"
```
4. 为了保证使⽤版本号⼀致的 Gem, 需要把 Gemfile 和 Gemfile.lock ⼀同保存到 Git ⾥⾯统⼀管理起来.

5. 利用脚本完成整套开发环境的搭建.在scripts/目录中存放了setup.sh脚本. Moments.xcworkspace进⾏开发了.
```
$ ./scripts/setup.sh
```
脚本内容：
第⼀步是在 rbenv 下安装特定版本的 Ruby 开发环境, 然后通过 RubyGems 安装 Bunlder, 接着使⽤ Bundler 安装 CocoaPods 和 fastlane, 最后安装各个 Pod. 
```
#!/bin/sh


# Install ruby using rbenv
ruby_version=`cat .ruby-version`
if [[ ! -d "$HOME/.rbenv/versions/$ruby_version" ]]; then
  rbenv install $ruby_version;
  rbenv init
fi

# Install bunlder
gem install bundler

# Install all gems
bundle install

# Install all pods
bundle exec pod install
```

## xccongif多环境支持

⼀般在构建⼀个 iOS App 的时候，需要⽤到 Xcode Project，Xcode Target，Build Settings，Build Configuration 和 Xcode Scheme 等构建配置。

### Xcode Project
⽤于组织源代码⽂件和资源⽂件。⼀个 Project 可以包含多个 Target，例如当我们新建⼀个 Xcode Project 的时候，它会⾃动⽣成 App 的主 Target，Unit Test Target 和 UI Test Target。

### Xcode Target
⽤来定义如何构建出⼀个产品（例如 App， Extension 或者 Framework），Target 可以指定需 要编译的源代码⽂件和需要打包的资源⽂件，以及构建过程中的步骤。

### Build Setting
保存了构建过程中需要⽤到的信息，它以⼀个变量的形式⽽存在，例如所⽀持的设备平台，或 者⽀持操作系统的最低版本等。

### Build Configuration
就是⼀组 Build Setting。 我们可以通过 Build Configuration 来分组和管理不同组合的 Build Setting 集合，然后传递给 Xcode 构建系统进⾏编译。

### Xcode Scheme
⽤于定义⼀个完整的构建过程，其包括指定哪些 Target 需要进⾏构建，构建过程中使⽤了哪 个 Build Configuration ，以及需要执⾏哪些测试案例等等。在项⽬新建的时候只有⼀个 Scheme，但可以为 同⼀个项⽬建⽴多个 Scheme。

### xcconfig
⼀般修改 Build Setting 的办法是在 Xcode 的 Build Settings 界⾯上进⾏。 这样做有⼀些不好的地⽅，⾸先是⼿⼯修改很容易出错，其次，最关键的是每次修改完毕以后都会修改了 xcodeproj 项⽬⽂档，导致 Git 历史很难查看和对⽐。Xcode 为我们提供了⼀个统⼀管理这些 Build Setting 的便利⽅法，那就是使⽤ xcconfig 配置⽂件 来管理。

xcconfig也叫作 Build configuration file（构建配置⽂件），我们可以使⽤它来为 Project 或 Target 定义⼀组 Build Setting。由于它是⼀个纯⽂本⽂件，我们可以使⽤ Xcode 以外的其他⽂本编辑器来修改，⽽且可以保 存到 Git 进⾏统⼀管理。 这样远⽐我们在 Xcode 的 Build Settings 界⾯上⼿⼯修改要⽅便很多，⽽且还不容 易出错。

Apple官网： https://help.apple.com/xcode/mac/11.4/#/dev745c5c974

关于config的key值，可以查看官网的构建设置参考：https://help.apple.com/xcode/mac/11.4/#/itcaec37c2a6?sub=devec8d38b11

关于xcconfig使用和配置，AFNetworker 和 Alamofire 的作者写了一个使用教程 https://nshipster.com/xcconfig/ ，具体配置可以看这个教程，和源码查看。


### 🔥🔥🔥 关于PRODUCT_BUNDLE_IDENTIFIER设置后不生效的问题？很多国内的网上说不能用xcconfig来配置，这是不正确的。

如果您要更改xcconfig中 PRODUCT_BUNDLE_IDENTIFIER 的值，您将看不到构建设置中反映的更改。那是因为包标识符当前在目标设置中是硬编码的。要解决此问题，请返回项目编辑器并选择 iOS-engineering Target。在build settings中搜索bundle字段，找到Product Bundle Identifier,将值改为：
```
$(PRODUCT_BUNDLE_IDENTIFIER)
```

### 🔥🔥🔥 bundle display name, 可以自定义一个APP_NAME的值，然后在iOS-engineering Target的General 把Display Nmae修改为：
```
$(APP_NAME)
```

### 🔥🔥🔥 同样关于APP Version 和 build Version用xcconfig来管理, 要解决此问题，请返回项目编辑器并选择 iOS-engineering Target。在build settings中搜索version字段，找到Current Project Version,将值改为Common.xcconfig中的字段：
```
$(PRODUCT_VERSION_BASE)
```
找到Marketing Version,将值改为Common.xcconfig中的字段：
```
$(PRODUCT_VERSION_SUFFIX)
```


注意：当您从Info.plist或.entitlements文件中引用构建设置时，您使用相同的引用语法。$(xxx)

这里的详细操作可以查看源码配置，或者下面的配置出处：
 https://www.kodeco.com/21441177-building-your-app-using-build-configurations-and-xcconfig


