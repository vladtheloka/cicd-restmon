import pytest
import requests

url = 'http://0.0.0.0:9090' 

class TestFlask():
   def test_index_page(self):
       r = requests.get(url+'/') 
       assert r.status_code == 200

   def test_get_cpu(self):
       r = requests.get(url+'/cpu')
       assert r.status_code == 200

   def test_get_cpupercent(self):
       r = requests.get(url+'/cpupercent')
       data = r.json()
       assert r.status_code == 200
       assert data['cpuuser'] + data['cpusystem'] <= 90

   def test_get_memory(self):
       r = requests.get(url+'/memory')
       data = r.json()
       assert r.status_code == 200
       assert data['freeMemory'] >= 1000

   def test_get_storage(self):
       r = requests.get(url+'/storage')
       data = r.json()
       assert r.status_code == 200
       assert data['rootfree'] >= 1000

   def test_get_platform(self): 
       r = requests.get(url+'/platform')
       assert r.status_code == 200
