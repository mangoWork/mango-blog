##1.NIO与IO的区别？
|  IO  |  NIO  |
| :--: | :---: |
| 面向流  | 面向缓冲  |
| 阻塞IO | 非阻塞IO |
|  无   |  选择器  |



## 2. NIO中的读和写

### 2.1 从文件中读取

* 读取文件的三个步骤

  * 从FileInputStream获取channel

    ```java
    FileInputStream fin = new FileInputStream("readandshow.txt");
    FileChannel fc = fin.getChannel();
    ```

  * 创建Bufffer

    ```java
    ByteBuffer buffer = ByteBuffer.allocate(1024);
    ```

  * 将数据从channel读取到buffer中

    ```java
    fc.read(buffer);
    ```

### 2.2 写入文件

* 写入文件的三个步骤

  * 从FileOutputStream获取channel

    ```java
    FileOutputStream fout = new FileOutputStream("writessomebytes.txt");
    FileChannel fc = fout.getChannel();
    ```

  * 创建缓冲区（Buffer）并且存放对象

    ```java
    ByteBuffer buffer = ByteBuffer.allocate(1024);
    for(int i=0; i <message.length; ++i){
      buffer.put(message[i]);
    }
    buffer.flip();
    ```

  * 写入缓冲区

    ```java
    fc.write(buffer);
    ```



## 3 缓冲区的内部细节

* NIO中有两个重要的缓冲区组件：状态变量和访问方法。
  * 每一次读/写操作都会改变缓冲区的状态。状态变量通过记录和跟踪这些变化，缓冲区就能够内部地管理自己的资源。
  * 从通道读取数据时，数据被放入缓冲区。在某些情况下，可以将这个缓冲区直接写入另一个通道，但是在一般情况下，您还需要查看数据，使用get()完成。同样，如果要将原始数据放入到缓冲区中，就需要使用put()方法。



### 3.1 状态变量

* 可以使用三个值来指定缓冲区在任意时刻的状态：

  * position
  * limit
  * capacity

* 这三个变量一起可以跟踪缓冲区的状态和它包含的数据。

  ​

* Position

  * 缓冲区是就上就是美化了数组。在从通道读取时，您将所读的数据放到底层的数组中。position变量跟踪已经写了多少数据。更准确的说，它指定了下一个字节将放到数组的那一个元素中。因此，如果您从通道中读三个字节到缓冲区。那么缓冲区的position将会设置3，指向第四个元素。

* Limit

  * limit变量表明还有多少数据需要取出（从缓冲区写入通道中），或者还有多少空间可以放入数据
  * position<=limit

* Capacity

  * 缓冲区的capacity表明可以存储在缓冲区的最大数据容量。实际上，它指定了底层数组的大小。
  * limit<=capacity

* 缓冲区的使用

  * 使用缓冲区将数据从输入通道拷贝到输出通道

    ```java
    while (true) {
         buffer.clear();
         int r = fcin.read( buffer );
         if (r==-1) {
           break;
         }
         buffer.flip();
         fcout.write( buffer );
    }
    ```

    ​

## 4 缓冲区的其他知识点

### 4.1 缓冲区的分配以及包装

* 在能够读以及写之前，必须有一个缓冲区。要创建缓冲区，就需要分配缓冲区。分配缓冲区使用的是allocate()来分配缓冲区：

  ```java
  ByteBuffer buffer = ByteBuffer.allocate(1024);
  ```

* allocate()方法分配一个具有指定大小的底层数组，并将它包装到一个缓冲区对象中，在上面代码中采用的是`ByteBuffer` 也可以将现有的数组转换为缓冲区，如下所示：

  ```java
  byte array[] = new byte[1024];
  ByteBuffer  buffer = ByteBuffer.wrap(array);
  ```

### 4.2 缓冲区分片

* slice()方法根据现有的缓冲区创建一种子缓冲区。也就是说，它创建一个新的缓冲区，新缓冲区和原来的缓冲区的一部分数据共享，如下所示：

  * 创建一个长度为10的`ByteBuffer`

    ```java
    ByteBuffer buffer = ByteBuffer.allocate(10);
    ```


  * 然后使用数据来填充这个缓冲区，在第n个槽中放入数字n:

    ```java
    for(int i=0; i<buffer.capacity(); ++i){
         buffer.put((byte)i);
    }
    ```

  * 现在对这个缓冲区分片，以创建一个包含3到6的子缓冲区。在某种意义上，子缓冲区就像原来的缓冲区中的一个窗口。窗口的开始和结束位置通过position和limit值来设定，然后调用Buffer的slice()方法：

    ```java
    buffer.position(3);
    buffer.limite(7);
    ByteBuffer slice = buffer.slice();
    ```

    ​

