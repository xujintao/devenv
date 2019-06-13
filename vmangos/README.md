### compile
https://github.com/vmangos/wiki/wiki/Compiling-on-Ubuntu

```
docker build -t xujintao/mangos:1.12.1 --target mangos .
docker build -t xujintao/realm:1.12.1 --target realm .
```

### get it work
https://github.com/vmangos/wiki/wiki/Getting-it-working

##### sql
```
# copy sql
cd ~/volumes/vmangos/sql
sudo cp ~/github.com/xujintao/devenv/vmangos/sql/create.sql .
sudo cp -r ~/github.com/vmangos/core/sql .
sudo cp ~/github.com/brotalnia/database/world_full_08_february_2019.sql sql/

# create databases
mysql -uroot -p < create.sql

# import exist data
cd sql
mysql -uroot -p realmd < logon.sql
mysql -uroot -p logs < logs.sql
mysql -uroot -p characters < characters.sql
mysql -uroot -p mangos < world_full_08_february_2019.sql

# import update data
cd migrations
bash merge.sh
mysql -uroot -p mangos < world_db_updates.sql

# init realmd.realmlist
mysql -uroot -p realmd -e 'insert into realmlist (name, address) values("Classic Bate", "192.168.0.101")';
```

##### data
http://www.ac-web.org/forums/showthread.php?230227-Light-s-Hope-Vanilla-Repack

##### etc