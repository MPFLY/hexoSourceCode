---
title: ES6中新增的处理字符串的方法
tags: ES6
categories: JS
date: 2019-05-25
copyright: true
---



#### 1. 检测字符串中是否包含某字符串

```javascript
includes()
str.includes(searchElement, fromIndex)
```

| 参数          | 描述                                                         |
| :------------ | :----------------------------------------------------------- |
| searchElement | 必须。需要查找的元素值                                       |
| fromIndex     | 可选。从该索引处开始查找 searchElement。如果为负值，则按升序从 array.length + fromIndex 的索引开始搜索。默认为 0 |

```javascript
const str = 'abcdefg'
str.includes('g') //true
```

#### 2. 是否以某个字符串开头

```javascript
startsWith()
str.startsWith(searchvalue, start)
```

| 参数        | 描述                             |
| :---------- | :------------------------------- |
| searchvalue | 必需，要查找的字符串。           |
| start       | 可选，查找的开始位置，默认为 0。 |

```javascript
const str = 'abcdefg'
str.startsWith('a') //true
```



#### 3. 是否以某个字符串结尾

```
endsWith()
endsWith(searchvalue, end)
```

| 参数        | 描述                                                         |
| :---------- | :----------------------------------------------------------- |
| searchvalue | 必需，要查找的字符串。                                       |
| end         | 可选，查找的结束位置，默认为 字符串长度-1。（从字符串开始到第end个） |

```javascript
const str = 'abcdefg'
str.endsWith('g') //true
str.endsWith('g', 3) //false
```



#### 4. 复制字符串

```
repeat()
repeat(count)
```

| 参数  | 描述               |
| :---- | :----------------- |
| count | 必需，复制的次数。 |

```javascript
const str = 'ABC'
str.repeat(2) //ABCABC
```



#### 结语

暂时先总结这几个，如有不正确的地方，欢迎在下方留言指正。😀😀😀