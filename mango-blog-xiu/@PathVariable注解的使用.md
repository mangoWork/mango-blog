
### @PathVariable注解的使用

##### 在Spring3.0中新增了带占位符的url
 
##### @PathVariable注解，用于获取url中的占位符参数，并绑定到控制器处理方法的入参中
````
 @ApiOperation("权限删除")
 @PostMapping("/delete/{id}")
 public SimpleRestResult deleteResources (@PathVariable("id") Integer id) {...}
 ````
  ##### /{xxx}/  -----@PathVariable("xxx")
