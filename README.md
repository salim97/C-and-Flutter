# test C++ and Flutter provided by Philip Lau

## Q1

The “tw_size_t” is uint32_t.

```cpp
template <typename T, size_t nLen>
constexpr tw_size_t read(T(&aryval)[nLen]) {
    if constexpr (std::is_standard_layout_v<T>) {
        return read(reinterpret_cast<char*>(aryval), sizeof(T) * nLen);
    }
}
```

Please explain the above snippet. What is the name of this kind of code: T(&aryval)[nlen]? What is the purpose of the function “read”?

## S1

The purpose is to read or process a raw block of memory containing nLen elements of type T. This can be used for tasks such as serialization, memory copying, or handling binary data efficiently, assuming the inner read function is designed to handle a buffer of bytes and return the number of bytes that were successfully processed.


## Q2

### Backend Apache2/C++

if you are using windows and you have docker installed then you can run docker-compose.yml which will start Linux virtual machine

```
docker-compose up
```

wait few minutes for ubuntu to install apache2 and g++ , once container start running then you can use postman to call end point 
127.0.0.1:8080/ as POST and you should get "Hello World!" back 

### Frontend Flutter

source code at folder "simple_flutter_app/"
you can compile it and run it on Android or IOS 

if you are running the app on android emulator use the following URL "http://10.0.2.2:8080"
ip 10.0.2.2 point back to localhost ( 127.0.0.1 ) since apache2 is running on docker container


![Android emulator](https://raw.githubusercontent.com/salim97/C-and-Flutter/main/qemu-system-x86_64_F8c2tJa0vX.png)

# Copyright © 2024

[Benabadji Mohammed Salim](https://github.com/salim97)
