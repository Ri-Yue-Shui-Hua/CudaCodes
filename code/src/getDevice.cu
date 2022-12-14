#include <iostream>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
int main() {
    cudaError_t cudaStatus;
    cudaDeviceProp cuInfo; // gpu属性的类
    int l32count;
    cudaStatus = cudaGetDeviceCount( &l32count); // 获取GPU数量
    if(cudaStatus != cudaSuccess)
    {
        fprintf(stderr, "cudaGetDeviceCount failed!");
        return 1;
    }
    std::cout << "the number of gpu: " << l32count << std::endl;

    for(int i=0; i<l32count; ++i)
    {
        cudaStatus = cudaGetDeviceProperties(&cuInfo, i); // 获取GPU信息
        if(cudaStatus != cudaSuccess)
        {
            fprintf(stderr, "cudaGetDeviceProperties failed!");
            return 1;
        }
        printf("Name: %s\n", cuInfo.name);
    }
    std::cout << "Hello, World!" << std::endl;
    return 0;
}

