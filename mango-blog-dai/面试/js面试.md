## 

### 1.  call、apply以及blind的区别？

* 这几个方法分别是：Function.prototype.call(), Function.prototype.apply(), 以及Function.prototype.blind()

* call调用方法并且参数的类型可以是多个

* apply调用方法并且参数的类型为数组

* blind返回一个新的函数，并且参数类型没有限制

* call demo：

  ```javascript
  var person1 = {firstName: 'Jon', lastName: 'Kuperman'};
  var person2 = {firstName: 'Kelly', lastName: 'King'};
  function say(greeting) {
      console.log(greeting + ' ' + this.firstName + ' ' + this.lastName);
  }
  say.call(person1, 'Hello'); // Hello Jon Kuperman
  say.call(person2, 'Hello'); // Hello Kelly King
  ```

* apply demo:

  ```javascript
  var person1 = {firstName: 'Jon', lastName: 'Kuperman'};
  var person2 = {firstName: 'Kelly', lastName: 'King'};
   
  function say(greeting) {
      console.log(greeting + ' ' + this.firstName + ' ' + this.lastName);
  }
   
  say.apply(person1, ['Hello']); // Hello Jon Kuperman
  say.apply(person2, ['Hello']); // Hello Kelly King
  ```

* blind demo:

  ```javascript
  var person1 = {firstName: 'Jon', lastName: 'Kuperman'};
  var person2 = {firstName: 'Kelly', lastName: 'King'};
   
  function say() {
      console.log('Hello ' + this.firstName + ' ' + this.lastName);
  }
   
  var sayHelloJon = say.bind(person1);
  var sayHelloKelly = say.bind(person2);
   
  sayHelloJon(); // Hello Jon Kuperman
  sayHelloKelly(); // Hello Kelly King
  ```

  ​

