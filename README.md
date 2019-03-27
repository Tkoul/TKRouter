# TKRouter

[![CI Status](https://img.shields.io/travis/TKRouter/TKRouter.svg?style=flat)](https://travis-ci.org/TKRouter/TKRouter)
[![Version](https://img.shields.io/cocoapods/v/TKRouter.svg?style=flat)](https://cocoapods.org/pods/TKRouter)
[![License](https://img.shields.io/cocoapods/l/TKRouter.svg?style=flat)](https://cocoapods.org/pods/TKRouter)
[![Platform](https://img.shields.io/cocoapods/p/TKRouter.svg?style=flat)](https://cocoapods.org/pods/TKRouter)


##介绍

1.Api万能路由利用AOP编程思想，指针参数，等来实现任意object-c 的API调用。
2.本sdk用于组件化开发模式，多sdk嵌套等复杂的情况！解决项目开发的耦合度。

组件开发模式：在庞大项目开发下，有多个sdk共同开发。主app就是一个空壳，各个组件sdk开发完毕，进行pod验证，打tag，执行repo push操作，最后提交到公司仓库。最后只要在主app进行多pod依赖，一键pod update ！把各个组件sdk拉下来！这就是最常用的组件开发。鄙人所在公司也是这种开发模式。
组件化开发的好处这里不做赘述！网上有很多资料，可以说大的项目已经离不开组件化的思想。

组件化路由：那么在这样的开发模式下，效率大大提升，并且分工明确，各个团队之间有条不紊。而在各个团队之间的桥梁--路由的作用就不言而喻！常规的路由，包括目前流行的路由三方组件都有自己的定义规则，一个项目突然适配起来不是那么简单。

开发问题：项目主App，包含多个组件(举个例子，比如就5个把，像京东商城，支付宝这个级别的有个百十个吧)，比如其中一个组件A，一个组件B。分别有俩个团队负责开发，都有自己完整的流程！那么两个库都依赖了AFNetworking 这个请求第三方（大公司会封装自己的请求框架轮子）。这里依照afnet为例子吧，毕竟太牛！哈哈
A单独开发：A项目，引入pod 'AFNetworking', '~> 3.0'  然后 高高兴兴去开发了，在项目期限结束的时候，打tag，pod lib验证，pod repo push 完事。
B单独开发：B为老组件，很早就引入pod 'AFNetworking', '~> 2.0'  然后 高高兴兴去开发了，在项目期限结束的时候，打tag，pod lib验证，pod repo push 完事。两个对很ok！

主app进行pod依赖，把各个组件下拉   pod 'A组件'， pod 'B组件'!

1.这个时候执行pod update 就出现问题了 拉不下来，因为pod版本不兼容。 记做  问题一

主APP负责人看了，会有两种解决方案
方案一：立即联系B,告知版本库升级到3.0用新的，告知所有的团队以某个版本为准。
方案二：把AFNetworking作为主App的直接bundel内容，其它组件去掉AFNetworking

对于方案一：版本冲突解决了，但是有100个组件 依赖了100个AFNetworking，有的组件提供源码，没问题，源码只会拉一份，有的提供的framework，经过pod打包默认加前缀的（无--no-mangle命令）！也就是有多少个静态库提供的组件，就会生成同样功能的AFNetworking，比如有50个组件是静态库，那么最后拉下来就会有51个AFNetworking存在项目中。（如果不加--no-mangle）对于静态库类型的组件，就会报错有很多个重复文件。---记做问题二

对于方案二：主app管理AFNetworking，那么在A和B单独开发的时候，不能依赖AFNetworking，只能导入主.h文件，把AFNetworking作为demoApp加入demo工程。也可以正常开发。但是进行pod lib 和 pod repo push的时候就推不上仓库了！因为pod验证会检测实现方法等，相当于少了AFNetworking库，压根过不去。--记做问题三

以上问题对组件特别的APP开发造成很大的困扰!为了解决这个问题，大牛们早就前行在道路上，就出现了“组件二进制化||平滑二进制组件”的实现，鄙人也在使用。原理就是把第三方共用组件比如AFNetworking先做成二进制文件，大家都依赖二进制文件来做到统一！能极大解决问题，弊端就是维护很多二进制，并且每次升级不同团队都要做二进制文件的md5哈希取值，这个值一样才能说明是同一个！每次代码升级开发完毕，必须把源码重新生成新的二进制，维护成本很高！有时候就忘了！

针对诸多的问题，我就尝试了TKRouter的实现。

TKRouter : 1.调用原子api ，没有什么规则，就像调用方法一样。
           2.多组件开发，都依赖某些第三方组件的时候，比如AFNetworking，我们一旦确定几百个团队有一个在用AFNetworking，那么我们就不管依赖的事情了
           甚至不去维护它，瞅一眼都懒！ 我们就直接路由调用。我们的项目和AFNetworking无任何直接关系，头文件都不需要引入。
           
下面是我的某个组件调用AFNetworking的网络检测代码：




## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements


## Installation

TKRouter is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TKRouter'
```

## Author

Tkoul, Tkoull@163.com

## License

TKRouter is available under the MIT license. See the LICENSE file for more info.
