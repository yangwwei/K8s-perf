#!/usr/bin/python
# -*- coding: latin-1 -*-

from pyspark import SparkConf
from pyspark import SparkContext

conf = SparkConf()
conf.setMaster('yarn-client')
conf.setAppName('spark-yarn')
sc = SparkContext(conf=conf)

def sleep(x):
   import time
   time.sleep(30)

rdd = sc.parallelize(range(10)).map(sleep).take(2)
print rdd
