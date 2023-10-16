import json
class execution_config:
    project = ''
    sprint = ''

    def __init__(self, file='execution_details.json'):
        f = open(file)
        config=json.load(f)
        self.project=config['project']
        self.sprint=config['sprint']
        f.close()


