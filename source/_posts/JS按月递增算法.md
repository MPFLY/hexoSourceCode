---
title: JS按月递增算法
tags: 算法
categories: JS
date: 2017-09-06
copyright: true
---

最近业务上遇到一个问题：已知格式为 xxxx/xx/xx的起始日期和结束日期，要得到一个数组，数组中存放从起始日期开始到结束日期间的若干个日期，每一个日期元素都比之前的日期大一个月。

以上是问题。

下面是代码：

```js
repayPlan = function(start,stop){
//		拿到从页面传来的 开始和结束的日期
		var date = [];
		/*将日期 字符串分割*/
		var start_ = start.split("/");
		var stop_ = stop.split("/");
		/*重新组合成一个新的字符串*/
		var d1 = start_[0] + start_[1] + start_[2];
		var d2 = stop_[0] + stop_[1] + stop_[2];
		/*转换成数字类型*/
		var dd1 = parseInt(d1);
		var dd2 = parseInt(d2);
		/*设置一个index */
		var index = dd1;
		/*进行循环 往date数组中push新的元素*/
		while(index < dd2){
			if(index%10000 < 1200){
				index += 100;
			}else{
				index += 10000-1100;
			}
			/*将数字类型的index转换为字符串类型,并重新用"/"连接*/
			index = index.toString().substring(0,4) +"/"+ index.toString().substring(4,6) +"/"+ index.toString().substring(6)
			/*将处理好的日期数据放入date数组中*/
			date.push(index);
//			再次拆分日期数据并转化为数字格式，用来下一次的比较	
			index = index.split("/")[0] + index.split("/")[1] + index.split("/")[2]
			index = parseInt(index);
		}
		//返回一个新的数组
		return date;
	}
```

