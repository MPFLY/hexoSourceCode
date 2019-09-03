---
title: mui——复制到剪贴板
tags: mui
categories: mui
date: 2018-10-12
copyright: true
---



##### 下面是mui中封装的复制到剪贴板的方法，可以直接复制使用。

```js
//  复制方法
function copy_fun(copy){//参数copy是要复制的文本内容
	mui.plusReady(function(){
		//判断是安卓还是ios
		if(mui.os.ios){
			//ios
			var UIPasteboard = plus.ios.importClass("UIPasteboard");
		    var generalPasteboard = UIPasteboard.generalPasteboard();
		    //设置/获取文本内容:
		    generalPasteboard.plusCallMethod({
		        setValue:copy,
		        forPasteboardType: "public.utf8-plain-text"
		    });
		    generalPasteboard.plusCallMethod({
		        valueForPasteboardType: "public.utf8-plain-text"
		    });
		    mui.toast("已成功复制到剪贴板");
		}else{
			//安卓
			var context = plus.android.importClass("android.content.Context");
			var main = plus.android.runtimeMainActivity();
			var clip = main.getSystemService(context.CLIPBOARD_SERVICE);
			plus.android.invoke(clip,"setText",copy);
			mui.toast("已成功复制到剪贴板");
		}
	});
}
```