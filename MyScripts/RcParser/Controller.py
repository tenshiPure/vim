#-*- coding: utf-8 -*-
import RcLoader

env = RcLoader.getEnv()

list = RcLoader.getList()

result = RcLoader.parse(list, env)

RcLoader.writeList(result)
