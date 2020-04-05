# FlutterOverlayEntry
#### 需求
1.在一个`充值button` 的上方显示一个`今日优惠`这样的气泡.</br>
2.充值的时候可以进入充值页面.</br>
3.点击`Show`展示一个弹框.</br>



#### 实现
使用`OverlayEntry` + `Positioned`的方式实现.复习了`圆角`,`showDialog`的使用.</br>
写文章的时候还是查了很多内容,知识掌握不牢固

#### 遇到的问题
在实现的过程中遇到了几个问题<br>

1.显示`气泡`的时候`findrenderobject' was called on null`
>解决办法:添加`PostFrameCallback` ,我在代码里面有描述`WidgetsBinding.instance.addPostFrameCallback(FrameCallback callback)`Widget 渲染完成的时候调用callback

2.在`push`到充值页面的时候`气泡`还是显示在屏幕上(蛋疼问题)<br>
3.在界面展示`弹框`的时候, 展示的`弹框`并没有覆盖住`气泡`
>解决办法:`2&3`的根本问题是使用的`Overlay`始终是同一个(`showDialog`也是使用`Overlay`展示相应的内容),所以在`State`的`build`的时候需要自定义一个`Overlay`返回

#### 思考

1.`Overlay.of(context)` 和  `overlayKey.currentState` 这两个都是什么?

前者是拿到当前`context`的`Overlay`,,后者是通过`overlayKey`拿到 `Overlay`(这个key绑定在一个自定义的`Overlay`上)




