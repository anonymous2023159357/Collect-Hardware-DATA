# Save devicequery result as csv

- Original_deviceQuery : origianl deviceQuery.cpp (위치는 우분투기준 /usr/local/cuda-11.4/samples/1_Utilities/deviceQuery)
- Outputcsv_deviceQuery : deviceQuery.cpp file that saves the devicequery result as csv


< Make csv file and permission setting >
  
```
sudo touch devicequery.csv // Create a csv file to store the devicequery value
sudo chmod ugo+rwx devicequery.csv // read only -> write & read only
``` 


< Compile >

1. deviceQuery.cpp change to Change_deviceQuery_For_DataCollect.cpp
2. sudo make ( If an error occurs, ```sudo make clean``` )
4. ./deviceQuery


< Save the devicequery.csv >
```
scp -i /Users/yuser/desktop/pemname.pem -r ubuntu@[ip]:/usr/local/cuda-11.4/samples/1_Utilities/deviceQuery/devicequery.csv  .
```  
  
  
