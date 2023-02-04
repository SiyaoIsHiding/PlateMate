import requests
from py_edamam import Edamam

app_id = "fa46041f"
app_key = "c80b25b0975bb65d035fe42200b1e734"
e = Edamam(recipes_appid=app_id, recipes_appkey=app_key)

recipes_list = e.search_recipe("onion and chicken")
for recipe in e.search_recipe("onion and chicken"):
    print(recipe)
    break

