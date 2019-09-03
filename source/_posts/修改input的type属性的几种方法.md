---
title: 修改input的type属性的几种方法
tags: input
categories: HTML
date: 2017-10-19
copyright: true
---



时隔两年，做了些许完善。以下是新的代码，html代码不变。
```js
<script type="text/javascript">
        // 通过js修改
        function change(){
            let password = document.getElementById("password")
            if(password.type === "password"){
                password.type = "text"
            }else{
                password.type = "password"
            }
        };
        $(function(){
            // 通过jqurey修改
            $(".btn").click(function(){
                let type =  $("#demo2").attr('type')
                if(type === "password"){
                    $("#demo2").attr("type","text");
                }else{
                    $("#demo2").attr("type","password");
                }
            });

            // 通过replaceWith方法修改
            $(".btn02").click(function(){
                let type =  $("#demo3").attr('type')
                let info =  $("#demo3").val()

                if(type === "password"){
                    $("#demo3").replaceWith(`<input value="${info}" type="text" name="demo3" id="demo3"/>`);
                }else{
                    $("#demo3").replaceWith(`<input value="${info}" type="password" name="demo3" id="demo3"/>`);
                }
            })
        });
    </script>
```

---------------------------------------- 以下是原答案----------------------------------------------------

 - 通过js直接改，在IE9以下是不行的。
 - 通过jquery的attr方法修改，在IE9以下也是不行的。

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改type属性</title>
		<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript">
			function change(){
				document.getElementById("password").type = "password";
			};
			
			$(function(){
				$(".btn").click(function(){
					$("#demo2").attr("type","password");
				});
				$(".btn02").click(function(){
					$(".demo3").replaceWith('<input type="password" name="demo3" id="demo3" value="" /> <button class="btn02">通过replace方法修改</button>');
				})
			});
		</script>
	</head>
	<body>
		<div class="js">
			<input type="text" name="password" id="password" value="" />
			<button id="changeType" onclick="change()">通过js修改</button>
		</div>
		
		<div class="jquery">
			<input type="text" name="demo2" id="demo2" value="" />
			<button class="btn">通过jqurey修改</button>
		</div>
		
		<div class="demo3">
			<input type="text" name="demo3" id="demo3" value="" />
			<button class="btn02">通过replaceAll方法修改</button>
		</div>
	</body>
</html>

```