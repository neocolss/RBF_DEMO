import json
from atlassian import Jira
from pathlib import Path
import os

ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
class jira_config:
    url = ''
    username = ''
    password = ''
    cloud = ''

    def __init__(self, file=os.path.join(ROOT_DIR, 'jira_api_config.json')):
        f = open(file)
        config = json.load(f)
        self.url = config['url']
        self.username = config['username']
        self.password = config['password']
        self.cloud = config['cloud']
        self.jira = Jira(url=self.url, username=self.username, password=self.password, cloud=self.cloud)
        f.close()


if __name__ == '__main__':
    import os
    print(os.path.dirname(os.path.abspath(__file__)))
    j = jira_config()
    print(j.url)
