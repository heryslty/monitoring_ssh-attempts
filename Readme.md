# ReadMe

bash scrip ini digunakan untuk melihat percobaan loging ssh pada setiap AlphaClient.

## prerequisite
- ini dilakukan pada os ubuntu 18.04
- setiap client dapat melakukan ssh ke server

## configurasi AlphaClient X
copy file client_X.sh ke AlphaClient (disini saya mengcopy ke dir /home/username/). sesuaikan isi dari file tersebut
```
username = username dari server
remote_host = Ip dari server
```
kemudian buat job crontab
```
crontab -e
```
kemudian inputkan
```
* * * * * /home/username/client_X.sh
```
sampai disini AlphaClient akan mengirimkan log auth.log (log ssh login) setiap menit ke AplhaServer.

## configurasi AlphaServer
copy file log_X.sh ke AlphaServer (disini saya mengcopy ke dir /home/username/). Sesuaikan isi dari file tersebut
```
username = username dari server
```
kemudian buat job crontab
```
crontab -e
```
kemudian inputkan
```
* * * * * /home/username/log_X.sh
```
sampai disini AlphaServer akan melakukan pengecekan file auth_X.log setiap menit. Apabila terdapat percobaan login baru di AlphaClient, maka AlphaServer akan memasukkan datanya kedalam file **log_ssh**. 

## NB
Apabila terdapat AlphaClient lain, maka dapat melakukan hal yang sama hanya saja perlu merubah huruf **X** menjadi huruf lain yang unik, karena ini akan menjadi identitas dari AlphaClient tersebut.
