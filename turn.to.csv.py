data = json.load(open(os.path.join(os.getcwd(), 'user_data2.json'),encoding="utf8"))

urls = data['Activity']['Video Browsing History']['VideoList']
len(urls)